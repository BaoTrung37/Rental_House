import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_reponse.g.dart';

@JsonSerializable()
class AddressResponse {
  AddressResponse({
    required this.id,
    required this.provinceId,
    required this.districtId,
    required this.communeId,
    required this.houseId,
  });
  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseFromJson(json);

  final String id;
  final String provinceId;
  final String districtId;
  final String communeId;
  final String houseId;

  Map<String, dynamic> toJson() => _$AddressResponseToJson(this);
}
