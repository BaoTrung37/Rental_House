import 'package:batru_house_rental/domain/entities/post/post_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_response.g.dart';

@JsonSerializable()
class PostResponse {
  PostResponse({
    required this.id,
    required this.area,
    required this.capacity,
    required this.streetName,
    required this.houseNumber,
    required this.depositMonth,
    required this.waterPrice,
    required this.electricPrice,
    required this.internetPrice,
    required this.parkingPrice,
    required this.rentalPrice,
    required this.userId,
    required this.title,
    required this.phoneNumber,
    required this.description,
    required this.createdAt,
    required this.address,
    this.isAvailableParking = false,
    this.isAvailablePost = true,
    this.isApproved = false,
    this.updatedAt,
    this.adminId,
  });
  factory PostResponse.fromJson(Map<String, dynamic> json) =>
      _$PostResponseFromJson(json);

  final String id;
  @JsonKey(defaultValue: 0)
  final int area;
  @JsonKey(defaultValue: 1)
  final int capacity;
  final String streetName;
  final String houseNumber;
  @JsonKey(defaultValue: 0)
  final int depositMonth;
  final int waterPrice;
  @JsonKey(defaultValue: 0)
  final int electricPrice;
  @JsonKey(defaultValue: 0)
  final int internetPrice;
  @JsonKey(defaultValue: 0)
  final int parkingPrice;
  final bool isAvailableParking;
  final bool isApproved;
  final bool isAvailablePost;
  final int rentalPrice;
  final String userId;
  @JsonKey(required: false, includeIfNull: false)
  final String? adminId;
  final String title;
  final String phoneNumber;
  final String description;
  final DateTime createdAt;
  @JsonKey(required: false)
  final DateTime? updatedAt;
  final String address;

  Map<String, dynamic> toJson() => _$PostResponseToJson(this);

  PostEntity toEntity() {
    return PostEntity(
      id: id,
      area: area,
      capacity: capacity,
      streetName: streetName,
      houseNumber: houseNumber,
      depositMonth: depositMonth,
      waterPrice: waterPrice,
      electricPrice: electricPrice,
      internetPrice: internetPrice,
      parkingPrice: parkingPrice,
      isAvailableParking: isAvailableParking,
      isApproved: isApproved,
      isAvailablePost: isAvailablePost,
      rentalPrice: rentalPrice,
      userId: userId,
      title: title,
      phoneNumber: phoneNumber,
      description: description,
      createdAt: createdAt,
      updatedAt: updatedAt,
      address: address,
    );
  }
}
