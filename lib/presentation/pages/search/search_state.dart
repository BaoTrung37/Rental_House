import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default(RoomType.rentalRoom) RoomType roomType,
  }) = _SearchState;
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
