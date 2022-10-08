import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  UserResponse({
    required this.id,
    required this.name,
    required this.avatar,
    required this.phoneNumber,
  });
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
      
  final String id;
  final String name;
  final String avatar;
  final String phoneNumber;

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
