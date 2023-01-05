import 'package:batru_house_rental/domain/use_case/article/get_articles_by_user_id_use_case.dart';
import 'package:batru_house_rental/presentation/pages/more_article/more_article_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoreArticleViewModel extends StateNotifier<MoreArticleState> {
  MoreArticleViewModel(
    this._getArticlesByUserIdUseCase,
  ) : super(const MoreArticleState());

  final GetArticlesByUserIdUseCase _getArticlesByUserIdUseCase;
  Future<void> initData(String userId) async {
    try {
      state = state.copyWith(status: LoadingStatus.inProgress);
      final allArticleList = await _getArticlesByUserIdUseCase.run(userId);

      final articleList = allArticleList
          .where((element) => element.house?.isApproved == true)
          .toList();
      state = state.copyWith(
        articleList: articleList,
        status: LoadingStatus.success,
      );
      state = state.copyWith(status: LoadingStatus.success);
    } catch (e) {
      state = state.copyWith(status: LoadingStatus.error);
      debugPrint('More Article: $e');
    }
  }
}
