import 'package:batru_house_rental/domain/entities/user/user_entity.dart';

class ChatRoomEntity {
  ChatRoomEntity({
    required this.id,
    required this.receiverUser,
    required this.lastMessage,
    required this.type,
    required this.lastMessageTime,
  });

  final String id;
  final UserEntity receiverUser;
  final String lastMessage;
  final String type;
  final DateTime lastMessageTime;
}
