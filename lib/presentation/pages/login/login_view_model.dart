import 'package:batru_house_rental/domain/use_case/article/get_initial_article_data_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/google_login_use_case.dart';
import 'package:batru_house_rental/presentation/pages/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginViewModel extends StateNotifier<LoginState> {
  LoginViewModel(
    this._googleLoginUseCase,
    this._getInitialArticleDataUseCase,
  ) : super(const LoginState());

  final GoogleLoginUseCase _googleLoginUseCase;
  final GetInitialArticleDataUseCase _getInitialArticleDataUseCase;

  Future<void> initData() async {
    await _getInitialArticleDataUseCase.run();
  }

  Future<bool> loginSuccess() async {
    try {
      final isSuccess = await _googleLoginUseCase.run();
      return isSuccess;
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }
}
