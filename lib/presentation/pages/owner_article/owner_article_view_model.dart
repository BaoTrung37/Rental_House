import 'package:batru_house_rental/domain/entities/article/article_entity.dart';
import 'package:batru_house_rental/domain/use_case/article/get_articles_by_user_id_use_case.dart';
import 'package:batru_house_rental/presentation/pages/owner_article/owner_article_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OwnerArticleViewModel extends StateNotifier<OwnerArticleState> {
  OwnerArticleViewModel(
    this._getArticlesByUserIdUseCase,
  ) : super(const OwnerArticleState());

  final GetArticlesByUserIdUseCase _getArticlesByUserIdUseCase;
  Future<void> initData(String userId) async {
    try {
      state = state.copyWith(status: LoadingStatus.inProgress);
      final houseArticleList = await _getArticlesByUserIdUseCase.run(userId);

      final articlePeddingList = <ArticleEntity>[];
      final articleApprovedList = <ArticleEntity>[];

      houseArticleList
          .map((e) => e.house?.isApproved == false
              ? articlePeddingList.add(e)
              : articleApprovedList.add(e))
          .toList();
      state = state.copyWith(
        articlePeddingList: articlePeddingList,
        articleApprovedList: articleApprovedList,
        status: LoadingStatus.success,
      );
    } catch (e) {
      state = state.copyWith(status: LoadingStatus.error);
      debugPrint('Owner Article: $e');
    }
  }
}
