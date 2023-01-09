import 'package:batru_house_rental/domain/entities/chat/chat_post_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_post_response.g.dart';

@JsonSerializable()
class ChatPostResponse {
  ChatPostResponse({
    required this.id,
    required this.postId,
    required this.userId,
    required this.typeHouse,
    required this.title,
    required this.url,
    required this.rentalPrice,
    required this.address,
  });

  factory ChatPostResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatPostResponseFromJson(json);

  final String id;
  final String postId;
  final String userId;
  final String typeHouse;
  final String title;
  final String url;
  final int rentalPrice;
  final String address;

  Map<String, dynamic> toJson() => _$ChatPostResponseToJson(this);

  ChatPostEntity toEntity() => ChatPostEntity(
        id: id,
        postId: postId,
        userId: userId,
        typeHouse: typeHouse,
        title: title,
        url: url,
        rentalPrice: rentalPrice,
        address: address,
      );
}
