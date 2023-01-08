// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:batru_house_rental/domain/entities/favorite/favorite_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_response.g.dart';

@JsonSerializable()
class FavoriteResponse {
  FavoriteResponse({
    required this.id,
    required this.postId,
    required this.userId,
    required this.typeHouse,
    required this.title,
    required this.url,
    required this.rentalPrice,
    required this.address,
  });

  factory FavoriteResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteResponseFromJson(json);

  final String id;
  final String postId;
  final String userId;
  final String typeHouse;
  final String title;
  final String url;
  final int rentalPrice;
  final String address;

  Map<String, dynamic> toJson() => _$FavoriteResponseToJson(this);

  FavoriteEntity toEntity() => FavoriteEntity(
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
