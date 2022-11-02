import 'package:batru_house_rental/data/models/chat/chat_response.dart';
import 'package:batru_house_rental/data/models/user/user_response.dart';
import 'package:batru_house_rental/domain/entities/chat/chat_entity.dart';
import 'package:batru_house_rental/domain/entities/chat/chat_room_entity.dart';
import 'package:batru_house_rental/domain/use_case/chat/get_chat_message_list_by_room_id_use_case.dart';
import 'package:batru_house_rental/domain/use_case/chat/post_chat_room_use_case.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoomRepository {
  final _fireStore = FirebaseFirestore.instance;
  // final _fireStorage = FirebaseStorage.instance;

  Future<List<ChatRoomEntity>> getChatRoomListByUserId(String userId) async {
    final chatRoomSnapshots = await _fireStore
        .collection('user')
        .doc(userId)
        .collection('chatroom')
        .get();
    final chatRoomList = <ChatRoomEntity>[];
    // debugPrint('chatRoomSnapshots: ${chatRoomSnapshots.docs.length}');
    for (final chatRoomSnapshot in chatRoomSnapshots.docs) {
      // debugPrint(chatRoomSnapshot.data()['receiverId']);
      final receiverUserSnapshot = await _fireStore
          .collection('user')
          .doc(chatRoomSnapshot.data()['receiverId'])
          .get();
      final receiverUser =
          UserResponse.fromJson(receiverUserSnapshot.data()!).toEntity();
      final lastMessage = await getLastMessage(chatRoomSnapshot.id);
      final chatRoomEntity = ChatRoomEntity(
        id: chatRoomSnapshot.id,
        receiverUser: receiverUser,
        lastMessage: lastMessage.message,
        type: lastMessage.type,
        lastMessageTime: lastMessage.createdAt,
      );
      chatRoomList.add(chatRoomEntity);
    }

    return chatRoomList;
  }

  Future<ChatEntity> getLastMessage(String chatRoomId) async {
    final chatRoomSnapshots = await _fireStore
        .collection('chatroom')
        .doc(chatRoomId)
        .collection('chat')
        .orderBy('id', descending: true)
        .limit(1)
        .get();

    return ChatResponse.fromJson(chatRoomSnapshots.docs.first.data())
        .toEntity();
  }

  Future<void> createChatRoom(PostChatRoomInput postChatRoomInput) async {
    final roomId = (postChatRoomInput.userId
                .toLowerCase()
                .compareTo(postChatRoomInput.receiverId.toLowerCase()) <
            0)
        ? '${postChatRoomInput.userId}-${postChatRoomInput.receiverId}'
        : '${postChatRoomInput.receiverId}-${postChatRoomInput.userId}';
    final roomSnapshot =
        await _fireStore.collection('chatroom').doc(roomId).get();
    final isRoomExist = roomSnapshot.exists;
    final chatEntity = postChatRoomInput.chatEntity;

    await _fireStore
        .collection('chatroom')
        .doc(roomId)
        .collection('chat')
        .doc(DateTime.now().microsecondsSinceEpoch.toString())
        .set(
          ChatResponse(
            id: chatEntity.id,
            senderId: chatEntity.senderId,
            message: chatEntity.message,
            type: chatEntity.type,
            createdAt: chatEntity.createdAt,
          ).toJson(),
        );
    if (!isRoomExist) {
      // add id chat room to user 1
      await _fireStore
          .collection('user')
          .doc(postChatRoomInput.userId)
          .collection('chatroom')
          .doc(roomId)
          .set({
        'receiverId': postChatRoomInput.receiverId,
      });
      // add id chat room to user 2
      await _fireStore
          .collection('user')
          .doc(postChatRoomInput.receiverId)
          .collection('chatroom')
          .doc(roomId)
          .set({
        'receiverId': postChatRoomInput.userId,
      });
    }
  }

}
