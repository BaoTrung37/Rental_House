import 'package:freezed_annotation/freezed_annotation.dart';

part 'house_reponse.g.dart';

@JsonSerializable()
class HouseResponse {
  HouseResponse({
    required this.id,
    required this.area,
    required this.capacity,
    required this.description,
    required this.streetName,
    required this.houseNumber,
    required this.despoitPrice,
    required this.waterPrice,
    required this.electricPrice,
    required this.internetPrice,
    required this.parkingPrice,
    required this.roomPrice,
  });
  factory HouseResponse.fromJson(Map<String, dynamic> json) =>
      _$HouseResponseFromJson(json);

  final String id;
  final int area;
  final int capacity;
  final String description;
  final String streetName;
  final String houseNumber;
  final String despoitPrice;
  final String waterPrice;
  final String electricPrice;
  final String internetPrice;
  final String parkingPrice;
  final String roomPrice;
  
  Map<String, dynamic> toJson() => _$HouseResponseToJson(this);
}
