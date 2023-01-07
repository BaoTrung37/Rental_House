// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:batru_house_rental/domain/use_case/auth/logout_use_case.dart';
import 'package:batru_house_rental/presentation/pages/admin_home/admin_home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminHomeViewModel extends StateNotifier<AdminHomeState> {
  AdminHomeViewModel(
    this._logoutUseCase,
  ) : super(const AdminHomeState());

  final LogoutUseCase _logoutUseCase;

  Future<void> logOut() async {
    await _logoutUseCase.run();
  }
}
