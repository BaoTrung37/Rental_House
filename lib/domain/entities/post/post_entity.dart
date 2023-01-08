import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_entity.freezed.dart';

@freezed
class PostEntity with _$PostEntity {
  const factory PostEntity({
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
    @Default(false) bool isAvailableParking,
    @Default(false) bool isAvailablePost,
    @Default(false) bool isApproved,
    @Default(0) int area,
    @Default(1) int capacity,
    @Default(500000) int rentalPrice,
    @Default(0) int depositMonth,
    @Default(0) int waterPrice,
    @Default(0) int electricPrice,
    @Default(0) int internetPrice,
    @Default(0) int parkingPrice,
  }) = _PostEntity;
}
