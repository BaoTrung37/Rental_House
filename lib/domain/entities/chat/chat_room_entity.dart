class ChatRoomEntity {
  ChatRoomEntity({
    required this.id,
    required this.receiverId,
    required this.onwerId,
    required this.lastMessage,
    required this.type,
    required this.createdAt,
    required this.isMe,
  });
  final String id;
  final String receiverId;
  final String onwerId;
  final String lastMessage;
  final String type;
  final DateTime createdAt;
  final bool isMe;
}
