import 'package:batru_house_rental/presentation/pages/post_article/post_article_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostArticleViewModel extends StateNotifier<PostArticleState> {
  PostArticleViewModel() : super(const PostArticleState());

  void initData() {}

  void setStep(int step) {
    state = state.copyWith(currentStep: step);
  }

  void nextStep() {
    state = state.copyWith(
        currentStep:
            state.currentStep < 2 ? state.currentStep + 1 : state.currentStep);
  }

  void previousStep() {
    state = state.copyWith(
        currentStep:
            state.currentStep > 0 ? state.currentStep - 1 : state.currentStep);
  }
}
