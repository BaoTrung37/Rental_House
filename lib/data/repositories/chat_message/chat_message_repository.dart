import 'package:batru_house_rental/data/models/chat/chat_post_response.dart';
import 'package:batru_house_rental/domain/entities/chat/chat_entity.dart';
import 'package:batru_house_rental/domain/entities/chat/chat_post_entity.dart';
import 'package:batru_house_rental/domain/use_case/chat/get_article_to_message_use_case.dart';
import 'package:batru_house_rental/domain/use_case/chat/get_chat_message_list_by_room_id_use_case.dart';
import 'package:batru_house_rental/domain/use_case/chat/post_article_to_message_use_case.dart';
import 'package:batru_house_rental/domain/use_case/chat/post_message_use_case.dart';
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

  Future<ChatPostEntity> getChatPostById(GetArticleToMessageInput input) {
    final roomId = input.roomId;
    final chatId = input.chatId;

    return _fireStore
        .collection('chatroom')
        .doc(roomId)
        .collection('chat')
        .doc(chatId)
        .collection('article')
        .doc(chatId)
        .get()
        .then((value) => ChatPostResponse.fromJson(value.data()!).toEntity());
  }

  void postMessage(PostMessageInput input) {
    final DocumentReference documentReference = _fireStore
        .collection('chatroom')
        .doc(input.roomId)
        .collection('chat')
        .doc(input.chatResponse.id);

    _fireStore.runTransaction(
      (transaction) async => transaction.set(
        documentReference,
        input.chatResponse.toJson(),
      ),
    );
  }

  void postChatPostMessage(PostArticleToMessageInput input) {
    final roomId =
        (input.userId.toLowerCase().compareTo(input.receiverId.toLowerCase()) <
                0)
            ? '${input.userId}-${input.receiverId}'
            : '${input.receiverId}-${input.userId}';
    final DocumentReference documentReference = _fireStore
        .collection('chatroom')
        .doc(roomId)
        .collection('chat')
        .doc(input.chatId)
        .collection('article')
        .doc(input.chatPostResponse.id);

    _fireStore.runTransaction(
      (transaction) async => transaction.set(
        documentReference,
        input.chatPostResponse.toJson(),
      ),
    );
  }
}
