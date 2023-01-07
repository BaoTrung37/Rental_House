class UserEntity {
  UserEntity({
    required this.id,
    required this.name,
    required this.avatar,
    this.phoneNumber,
    this.role = 0,
  });
  final String id;
  final String name;
  final String avatar;
  final String? phoneNumber;
  final int role;
}
