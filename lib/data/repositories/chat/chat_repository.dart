import 'package:batru_house_rental/data/models/chat/chat_entity.dart';

class ChatRepository {
  Future<List<ChatEntity>> getChatList() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      ChatEntity(
        id: '1',
        senderId: 'sasd',
        receiverId: 'adsdas',
        message: 'Hihihaiaha',
        type: ChatType.message.value,
        createdAt: DateTime.now().toIso8601String(),
        isMe: true,
      ),
      ChatEntity(
        id: '2',
        senderId: 'adsdas',
        receiverId: 'sasd',
        message: 'sasdsasdsasdsasdsasdsasdsasdsasdsasd',
        type: ChatType.message.value,
        createdAt: DateTime.now().toIso8601String(),
        isMe: false,
      ),
      ChatEntity(
        id: '3',
        senderId: 'sasd',
        receiverId: 'adsdas',
        message: 'Hihihaiaha',
        type: ChatType.message.value,
        createdAt: DateTime.now().toIso8601String(),
        isMe: true,
      ),
    ];
  }
}
