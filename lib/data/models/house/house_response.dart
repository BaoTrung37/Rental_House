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
    required this.userId,
    required this.title,
    required this.phoneNumber,
    required this.description,
    required this.createdAt,
    this.updatedAt,
  });
  factory HouseResponse.fromJson(Map<String, dynamic> json) =>
      _$HouseResponseFromJson(json);

  final String id;
  @JsonKey(defaultValue: 0)
  final int area;
  @JsonKey(defaultValue: 1)
  final int capacity;
  final String streetName;
  final String houseNumber;
  @JsonKey(defaultValue: 0)
  final int depositPrice;
  final int waterPrice;
  @JsonKey(defaultValue: 0)
  final int electricPrice;
  @JsonKey(defaultValue: 0)
  final int internetPrice;
  @JsonKey(defaultValue: 0)
  final int parkingPrice;
  @JsonKey(defaultValue: false)
  final bool isAvailableParking;
  final int rentalPrice;
  final String userId;
  final String title;
  final String phoneNumber;
  final String description;
  final DateTime createdAt;
  @JsonKey(required: false)
  final DateTime? updatedAt;

  Map<String, dynamic> toJson() => _$HouseResponseToJson(this);
}
