import 'package:freezed_annotation/freezed_annotation.dart';

part 'house_entity.freezed.dart';

@freezed
class HouseEntity with _$HouseEntity {
  const factory HouseEntity({
    required String id,
    required String streetName,
    required String houseNumber,
    required String userId,
    required String title,
    required String phoneNumber,
    required String description,
    required DateTime createdAt,
    required String address,
    DateTime? updatedAt,
    @Default(false) isAvailableParking,
    @Default(0) int area,
    @Default(1) int capacity,
    @Default(500000) int rentalPrice,
    @Default(0) int depositPrice,
    @Default(0) int waterPrice,
    @Default(0) int electricPrice,
    @Default(0) int internetPrice,
    @Default(0) int parkingPrice,
  }) = _HouseEntity;
}
