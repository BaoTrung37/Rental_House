import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:batru_house_rental/presentation/utilities/enums/login_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default(LoginType.customer) LoginType loginType,
    String? adminEmail,
    String? adminPassword,
    @Default('') String appError,
  }) = _LoginState;
}
