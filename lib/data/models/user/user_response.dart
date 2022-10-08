import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  UserResponse({
    required this.id,
    required this.name,
    required this.avatar,
    this.phoneNumber,
  });
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  final String id;
  final String name;
  final String avatar;
  @JsonKey(includeIfNull: false)
  final String? phoneNumber;

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
