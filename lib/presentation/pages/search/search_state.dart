import 'package:batru_house_rental/data/models/room/room_dto.dart';
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
