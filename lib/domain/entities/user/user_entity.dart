class UserEntity {
  UserEntity({
    required this.id,
    required this.name,
    required this.avatar,
    this.phoneNumber,
  });
  final String id;
  final String name;
  final String avatar;
  final String? phoneNumber;
}
