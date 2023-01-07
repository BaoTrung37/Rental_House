import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_post_state.freezed.dart';

@freezed
class AdminPostState with _$AdminPostState {
  const factory AdminPostState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    String? errorMessage,
  }) = _AdminPostState;
}
