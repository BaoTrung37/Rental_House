import 'package:freezed_annotation/freezed_annotation.dart';

part 'house_response.g.dart';

@JsonSerializable()
class HouseResponse {
  HouseResponse({
    required this.id,
    required this.area,
    required this.capacity,
    required this.streetName,
    required this.houseNumber,
    required this.depositPrice,
    required this.waterPrice,
    required this.electricPrice,
    required this.internetPrice,
    required this.parkingPrice,
    required this.isAvailableParking,
    required this.rentalPrice,
  });
  factory HouseResponse.fromJson(Map<String, dynamic> json) =>
      _$HouseResponseFromJson(json);

  final String id;
  final int area;
  final int capacity;
  final String streetName;
  final String houseNumber;
  final int depositPrice;
  final int waterPrice;
  final int electricPrice;
  final int internetPrice;
  final int parkingPrice;
  final bool isAvailableParking;
  final int rentalPrice;

  Map<String, dynamic> toJson() => _$HouseResponseToJson(this);
}
