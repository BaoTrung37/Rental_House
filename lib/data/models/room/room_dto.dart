class RoomDto {
  RoomDto({
    required this.id,
    required this.userId,
    required this.title,
    required this.roomType,
    required this.roomDescription,
    required this.roomAreage,
    required this.gender,
    required this.roomPrice,
    required this.deposit,
    required this.district,
    required this.numberPhone,
    required this.capacity,
    required this.createdAt,
    this.electricityBill,
    this.waterBill,
    this.internetBill,
    this.parkingFee,
  });
  final String id;
  final String userId;
  final String title;
  final RoomType roomType;
  final String roomDescription;
  final int roomAreage;
  final String gender;
  final int roomPrice;
  final int deposit;
  final int? electricityBill;
  final int? waterBill;
  final int? internetBill;
  final int? parkingFee;
  final String district;
  final String numberPhone;
  final int capacity;
  final DateTime createdAt;
  final List<String> images = [];
}

enum RoomType {
  homeStay,
  rentalRoom,
  house,
  apartment,
}

extension RoomTypeExtension on RoomType {
  String get title {
    switch (this) {
      case RoomType.homeStay:
        return 'Home stay';
      case RoomType.rentalRoom:
        return 'Phòng cho thuê';
      case RoomType.house:
        return 'Nhà nguyên căn';
      case RoomType.apartment:
        return 'Căn hộ';
    }
  }
}
