import 'package:batru_house_rental/data/services/preference_services/shared_preferences_manager.dart';
import 'package:batru_house_rental/domain/use_case/article/get_initial_article_data_use_case.dart';
import 'package:batru_house_rental/presentation/pages/splash/splash_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class SplashViewModel extends StateNotifier<SplashState> {
  SplashViewModel(
    this._getInitialArticleDataUseCase,
    this._sharedPreferencesManager,
  ) : super(const SplashState());

  final GetInitialArticleDataUseCase _getInitialArticleDataUseCase;
  final SharedPreferencesManager _sharedPreferencesManager;

  Future<void> initData() async {
    await _getInitialArticleDataUseCase.run();
  }

  int? get getLoginType => _sharedPreferencesManager.getLoginType();
}
