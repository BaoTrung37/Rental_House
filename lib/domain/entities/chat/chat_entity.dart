class ChatEntity {
  ChatEntity({
    required this.id,
    required this.senderId,
    required this.message,
    required this.type,
    required this.createdAt,
  });
  final String id;
  final String senderId;
  final String message;
  final String type;
  final DateTime createdAt;
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
