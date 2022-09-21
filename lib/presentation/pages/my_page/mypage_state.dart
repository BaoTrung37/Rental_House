import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mypage_state.freezed.dart';

@freezed
class MyPageState with _$MyPageState {
  const factory MyPageState({
    @Default(LoadingStatus.initial) LoadingStatus status,
  }) = _MyPageState;
}
