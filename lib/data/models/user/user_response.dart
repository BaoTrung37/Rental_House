import 'package:batru_house_rental/domain/entities/user/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  UserResponse({
    required this.id,
    required this.name,
    required this.avatar,
    required this.role,
    this.phoneNumber,
  });
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  final String id;
  final String name;
  final String avatar;
  @JsonKey(includeIfNull: false)
  final String? phoneNumber;
  @JsonKey(defaultValue: 0)
  final int role;

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  UserEntity toEntity() => UserEntity(
        id: id,
        name: name,
        avatar: avatar,
        phoneNumber: phoneNumber,
        role: role,
      );
}
