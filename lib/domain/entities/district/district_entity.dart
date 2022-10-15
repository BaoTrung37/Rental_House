class DistrictEntity {
  DistrictEntity({
    required this.id,
    required this.name,
    required this.province,
    required this.provinceId,
    this.imageUrl,
  });
  final String id;
  final String name;
  final String? imageUrl;
  final String province;
  final String provinceId;
}
