import 'package:batru_house_rental/domain/entities/chat/chat_room_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ChatRepository {
  final _fireStore = FirebaseFirestore.instance;
  final _fireStorage = FirebaseStorage.instance;

  Future<List<ChatRoomEntity>> getChatRoomList(String userId) async {
    final chatRoomSnapshots = await _fireStore
        .collection('chatroom')
        .where('user1', isEqualTo: userId)
        .where('user2', isEqualTo: userId)
        .get();
    final chatRoomList = <ChatRoomEntity>[];
    chatRoomSnapshots.docs.map((e) async {
      final chatSnapshots = await _fireStore
          .collection('chatroom')
          .doc(e.id)
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .limit(1)
          .get();
      final chatRoom = ChatRoomEntity(
        id: e.id,
        receiverId:
            e.data()['user2'] != userId ? e.data()['user2'] : e.data()['user1'],
        onwerId: userId,
        lastMessage: chatSnapshots.docs.first.data()['message'],
        type: chatSnapshots.docs.first.data()['type'],
        createdAt: chatSnapshots.docs.first.data()['createdAt'],
        isMe: chatSnapshots.docs.first.data()['isMe'],
      );
      chatRoomList.add(chatRoom);
    });

    return chatRoomList;
  }

  Stream<QuerySnapshot> getChatMessage(String groupChatId, int limit) {
    return _fireStore
        .collection('chats')
        .doc(groupChatId)
        .collection(groupChatId)
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .snapshots();
  }

  void sendMessage(String lastMessage, int type, String groupId, String idFrom,
      String idTo) {
    // final DocumentReference documentReference = _fireStore
    //     .collection('FirestoreConstants.pathChatsCollection')
    //     .doc(groupId)
    //     .collection(groupId)
    //     .doc(DateTime.now().millisecondsSinceEpoch.toString());

    // final ChatInfo chatInfo = ChatInfo(
    //   idFrom: idFrom,
    //   idTo: idTo,
    //   lastMessage: lastMessage,
    //   timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
    //   type: type,
    // );

    // _fireStore.runTransaction(
    //   (transaction) async => transaction.set(
    //     documentReference,
    //     chatInfo.toJson(),
    //   ),
    // );
  }
}
