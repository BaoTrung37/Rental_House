import 'package:batru_house_rental/data/utilities/common/json_date_time_converter.dart';
import 'package:batru_house_rental/domain/entities/chat/chat_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_response.g.dart';

@JsonSerializable()
@JsonDateTimeConverter()
class ChatResponse {
  ChatResponse({
    required this.id,
    required this.senderId,
    required this.message,
    required this.type,
    required this.createdAt,
  });
  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);

  final String id;
  final String senderId;
  final String message;
  final String type;
  final DateTime createdAt;

  Map<String, dynamic> toJson() => _$ChatResponseToJson(this);

  ChatEntity toEntity() => ChatEntity(
        id: id,
        senderId: senderId,
        message: message,
        type: type,
        createdAt: createdAt,
      );
}
