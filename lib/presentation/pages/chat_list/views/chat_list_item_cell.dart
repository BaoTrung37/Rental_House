import 'package:batru_house_rental/domain/entities/chat_room/chat_room_entity.dart';
import 'package:batru_house_rental/presentation/widgets/infinite_list/infinite_list_view.dart';

class BubbleChatCell with Datasource<ChatRoomData> {
  BubbleChatCell(this._chatRoomData);
  @override
  ChatRoomData get getData => _chatRoomData;

  final ChatRoomData _chatRoomData;
}

class ChatRoomData {
  ChatRoomData({
    required this.chatRoomEntity,
  });
  ChatRoomEntity chatRoomEntity;
}
