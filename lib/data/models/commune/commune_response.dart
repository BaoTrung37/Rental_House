import 'package:freezed_annotation/freezed_annotation.dart';

part 'commune_response.g.dart';

@JsonSerializable()
class CommuneResponse {
  CommuneResponse({
    required this.id,
    required this.provinceId,
    required this.name,
  });
  factory CommuneResponse.fromJson(Map<String, dynamic> json) =>
      _$CommuneResponseFromJson(json);

  final String id;
  final String provinceId;
  final String name;

  Map<String, dynamic> toJson() => _$CommuneResponseToJson(this);
}
