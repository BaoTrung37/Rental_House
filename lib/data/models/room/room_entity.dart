class RoomEntity {
  RoomEntity({
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
  final String roomType;
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
