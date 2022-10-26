class ChatEntity {
  ChatEntity({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.type,
    required this.createdAt,
    this.isMe = false,
  });
  final String id;
  final String senderId;
  final String receiverId;
  final String message;
  final String type;
  final String createdAt;
  final bool isMe;
}

enum ChatType {
  message,
  image,
  infoRoom,
}

extension ChatTypeExtension on ChatType {
  String get value {
    switch (this) {
      case ChatType.message:
        return 'message';
      case ChatType.image:
        return 'image';
      case ChatType.infoRoom:
        return 'infoRoom';
    }
  }
}
