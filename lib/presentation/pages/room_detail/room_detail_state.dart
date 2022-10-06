import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_detail_state.freezed.dart';

@freezed
class RoomDetailState with _$RoomDetailState {
  const factory RoomDetailState({
    @Default(LoadingStatus.initial) LoadingStatus status,
  }) = _RoomDetailState;
}
