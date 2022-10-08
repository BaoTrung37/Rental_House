import 'package:freezed_annotation/freezed_annotation.dart';

part 'province_response.g.dart';

@JsonSerializable()
class ProvinceResponse {
  ProvinceResponse({
    required this.id,
    required this.name,
  });
  factory ProvinceResponse.fromJson(Map<String, dynamic> json) =>
      _$ProvinceResponseFromJson(json);

  final String id;
  final String name;

  Map<String, dynamic> toJson() => _$ProvinceResponseToJson(this);
}
