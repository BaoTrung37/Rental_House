import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_home_state.freezed.dart';

@freezed
class AdminHomeState with _$AdminHomeState {
  const factory AdminHomeState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    String? errorMessage,
  }) = _AdminHomeState;
}
