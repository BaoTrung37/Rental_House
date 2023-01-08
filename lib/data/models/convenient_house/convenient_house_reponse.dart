import 'package:freezed_annotation/freezed_annotation.dart';

part 'convenient_house_reponse.g.dart';

@JsonSerializable()
class ConvenientHouseResponse {
  ConvenientHouseResponse({
    required this.id,
    required this.postId,
    required this.convenientId,
  });
  factory ConvenientHouseResponse.fromJson(Map<String, dynamic> json) =>
      _$ConvenientHouseResponseFromJson(json);

  final String id;
  final String postId;
  final String convenientId;

  Map<String, dynamic> toJson() => _$ConvenientHouseResponseToJson(this);
}
