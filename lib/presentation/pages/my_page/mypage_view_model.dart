import 'package:batru_house_rental/domain/use_case/auth/logout_use_case.dart';
import 'package:batru_house_rental/presentation/pages/my_page/mypage_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPageViewModel extends StateNotifier<MyPageState> {
  MyPageViewModel(
    this._logoutUseCase,
  ) : super(const MyPageState());

  final LogoutUseCase _logoutUseCase;

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
