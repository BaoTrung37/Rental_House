// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:batru_house_rental/domain/use_case/auth/logout_use_case.dart';
import 'package:batru_house_rental/presentation/pages/admin_home/admin_post_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminPostViewModel extends StateNotifier<AdminPostState> {
  AdminPostViewModel(
    this._logoutUseCase,
  ) : super(const AdminPostState());

  final LogoutUseCase _logoutUseCase;

  Future<void> logOut() async {
    await _logoutUseCase.run();
  }
}
