import 'package:freezed_annotation/freezed_annotation.dart';

part 'house_type_response.g.dart';

@JsonSerializable()
class HouseTypeResponse {
  HouseTypeResponse({
    required this.id,
    required this.typeId,
    required this.houseId,
  });
  factory HouseTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$HouseTypeResponseFromJson(json);

  final String id;
  final String typeId;
  final String houseId;
  
  Map<String, dynamic> toJson() => _$HouseTypeResponseToJson(this);
}
