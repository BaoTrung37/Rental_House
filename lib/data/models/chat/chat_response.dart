import 'package:batru_house_rental/data/utilities/common/json_date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_response.g.dart';

@JsonSerializable()
@JsonDateTimeConverter()
class ChatResponse {
  ChatResponse({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.type,
    required this.createdAt,
    required this.isMe,
  });
  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);

  final String id;
  final String senderId;
  final String receiverId;
  final String message;
  final String type;
  final DateTime createdAt;
  final bool isMe;

  Map<String, dynamic> toJson() => _$ChatResponseToJson(this);
}
