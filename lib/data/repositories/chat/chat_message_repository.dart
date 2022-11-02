import 'package:batru_house_rental/domain/entities/chat/chat_entity.dart';
import 'package:batru_house_rental/domain/use_case/chat/get_chat_message_list_by_room_id_use_case.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessageRepository {
  final _fireStore = FirebaseFirestore.instance;
  late Stream<List<ChatEntity>> _stream;

  Stream<List<ChatEntity>> getChatStream() {
    return _stream;
  }

  Stream<QuerySnapshot> getChatMessageListByRoomId(
      GetChatMessageListByIdInput input) {
    return _fireStore
        .collection('chatroom')
        .doc(input.roomId)
        .collection('chat')
        .orderBy('id', descending: true)
        .limit(input.limit)
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
