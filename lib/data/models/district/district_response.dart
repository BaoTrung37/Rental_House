import 'package:freezed_annotation/freezed_annotation.dart';

part 'district_response.g.dart';

@JsonSerializable()
class DistrictResponse {
  DistrictResponse({
    required this.id,
    required this.provinceId,
    required this.province,
    required this.name,
    this.imageUrl,
  });
  factory DistrictResponse.fromJson(Map<String, dynamic> json) =>
      _$DistrictResponseFromJson(json);

  final String id;
  @JsonKey(required: false)
  final String? imageUrl;
  final String provinceId;
  final String province;
  final String name;

  Map<String, dynamic> toJson() => _$DistrictResponseToJson(this);
}
