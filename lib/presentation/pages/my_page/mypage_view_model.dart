import 'package:batru_house_rental/domain/use_case/auth/get_current_user_information_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/logout_use_case.dart';
import 'package:batru_house_rental/presentation/pages/my_page/mypage_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPageViewModel extends StateNotifier<MyPageState> {
  MyPageViewModel(
    this._logoutUseCase,
    this._getUserInformationUseCase,
  ) : super(const MyPageState());

  final LogoutUseCase _logoutUseCase;
  final GetCurrentUserInformationUseCase _getUserInformationUseCase;

  Future<void> initData() async {
    try {
      state = state.copyWith(status: LoadingStatus.inProgress);
      final user = await _getUserInformationUseCase.run();
      state = state.copyWith(
        status: LoadingStatus.success,
        user: user,
      );
    } on Exception catch (error) {
      state = state.copyWith(status: LoadingStatus.error);
      debugPrint(error.toString());
    }
  }

  Future<String> getCurrentUserId() async {
    final user = await _getUserInformationUseCase.run();
    return user.id;
  }

  Future<void> logout(VoidCallback? action) async {
    state = state.copyWith(
      status: LoadingStatus.inProgress,
    );
    try {
      await _logoutUseCase.run();
      action?.call();
    } on Exception catch (error) {
      state = state.copyWith(
        status: LoadingStatus.error,
      );
      debugPrint(error.toString());
    }

    state = state.copyWith(
      status: LoadingStatus.success,
    );
  }
}
