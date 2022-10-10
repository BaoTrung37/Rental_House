import 'package:freezed_annotation/freezed_annotation.dart';

part 'owner_house_response.g.dart';

@JsonSerializable()
class OwnerHouseResponse {
  OwnerHouseResponse({
    required this.id,
    required this.userId,
    required this.articleId,
  });
  factory OwnerHouseResponse.fromJson(Map<String, dynamic> json) =>
      _$OwnerHouseResponseFromJson(json);

  final String id;
  final String userId;
  final String articleId;

  Map<String, dynamic> toJson() => _$OwnerHouseResponseToJson(this);
}
