import 'package:freezed_annotation/freezed_annotation.dart';

part 'house_response.g.dart';

@JsonSerializable()
class HouseResponse {
  HouseResponse({
    required this.id,
    required this.area,
    required this.capacity,
    required this.description,
    required this.streetName,
    required this.houseNumber,
    required this.depositPrice,
    required this.waterPrice,
    required this.electricPrice,
    required this.internetPrice,
    required this.parkingPrice,
    required this.roomPrice,
    required this.phoneNumber,
  });
  factory HouseResponse.fromJson(Map<String, dynamic> json) =>
      _$HouseResponseFromJson(json);

  final String id;
  final int area;
  final int capacity;
  final String description;
  final String streetName;
  final String houseNumber;
  final int depositPrice;
  final int waterPrice;
  final int electricPrice;
  final int internetPrice;
  final int parkingPrice;
  final int roomPrice;
  final String phoneNumber;

  Map<String, dynamic> toJson() => _$HouseResponseToJson(this);
}
