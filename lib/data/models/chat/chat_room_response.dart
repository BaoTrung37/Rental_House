import 'package:batru_house_rental/data/utilities/common/json_date_time_converter.dart';
import 'package:batru_house_rental/domain/entities/chat/chat_room_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_response.g.dart';

@JsonDateTimeConverter()
@JsonSerializable()
class ChatRoomResponse {
  ChatRoomResponse({
    required this.id,
    required this.receiverId,
    required this.lastMessage,
    required this.type,
    required this.lastMessageTime,
  });

  factory ChatRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomResponseFromJson(json);

  final String id;
  final String receiverId;
  final String lastMessage;
  final String type;
  final DateTime lastMessageTime;

  Map<String, dynamic> toJson() => _$ChatRoomResponseToJson(this);

  ChatRoomEntity toEntity() => ChatRoomEntity(
        id: id,
        receiverId: receiverId,
        lastMessage: lastMessage,
        type: type,
        lastMessageTime: lastMessageTime,
      );
}
