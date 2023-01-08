import 'package:batru_house_rental/data/services/preference_services/shared_preferences_manager.dart';
import 'package:batru_house_rental/domain/use_case/article/get_initial_article_data_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/email_login_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/google_login_use_case.dart';
import 'package:batru_house_rental/presentation/pages/login/login_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/login_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginViewModel extends StateNotifier<LoginState> {
  LoginViewModel(
    this._googleLoginUseCase,
    this._getInitialArticleDataUseCase,
    this._emailLoginUseCase,
    this._sharedPreferencesManager,
  ) : super(const LoginState());

  final GoogleLoginUseCase _googleLoginUseCase;
  final GetInitialArticleDataUseCase _getInitialArticleDataUseCase;
  final EmailLoginUseCase _emailLoginUseCase;
  final SharedPreferencesManager _sharedPreferencesManager;

  Future<void> initData() async {
    // await _getInitialArticleDataUseCase.run();
    state = state.copyWith(
      loginType:
          _sharedPreferencesManager.getLoginType() == LoginType.customer.index
              ? LoginType.customer
              : LoginType.admin,
    );
  }

  Future<bool> customerLoginSuccess() async {
    try {
      final isSuccess = await _googleLoginUseCase.run();
      return isSuccess;
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  Future<bool> adminLoginSuccess() async {
    final email = state.adminEmail;
    final password = state.adminPassword;

    if (email == null ||
        password == null ||
        email.isEmpty ||
        password.isEmpty) {
      return false;
    }

    try {
      final isSuccess = await _emailLoginUseCase.run(
        EmailLoginInput(email: email, password: password),
      );
      return isSuccess;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        state = state.copyWith(appError: 'Không tìm thấy tài khoản này');
      } else if (e.code == 'wrong-password') {
        state = state.copyWith(appError: 'Sai mật khẩu');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  void changedLoginType() {
    final loginType = state.loginType;
    debugPrint('loginType: ${state.loginType}');
    state = state.copyWith(
      loginType: loginType == LoginType.customer
          ? LoginType.admin
          : LoginType.customer,
    );
  }

  void setAdminEmail(String email) {
    state = state.copyWith(
      adminEmail: email,
    );
  }

  void setAdminPassword(String password) {
    state = state.copyWith(
      adminPassword: password,
    );
  }
}
