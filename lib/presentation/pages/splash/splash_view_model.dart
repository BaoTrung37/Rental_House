import 'package:batru_house_rental/domain/use_case/article/get_initial_article_data_use_case.dart';
import 'package:batru_house_rental/presentation/pages/splash/splash_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashViewModel extends StateNotifier<SplashState> {
  SplashViewModel(
    this._getInitialArticleDataUseCase,
  ) : super(const SplashState());

  final GetInitialArticleDataUseCase _getInitialArticleDataUseCase;

  Future<void> initData() async {
    await _getInitialArticleDataUseCase.run();
  }
}
