// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:batru_house_rental/domain/entities/article/article_entity.dart';
import 'package:batru_house_rental/domain/use_case/article/get_article_list_use_case.dart';
import 'package:batru_house_rental/presentation/pages/admin_post/admin_post_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminPostViewModel extends StateNotifier<AdminPostState> {
  AdminPostViewModel(
    this._getArticleListUseCase,
  ) : super(const AdminPostState());

  final GetArticleListUseCase _getArticleListUseCase;

  Future<void> initData() async {
    try {
      state = state.copyWith(status: LoadingStatus.inProgress);
      final houseArticleList = await _getArticleListUseCase.run(1);

      final articlePeddingList = <ArticleEntity>[];
      final articleApprovedList = <ArticleEntity>[];

      houseArticleList
          .map((e) => e.house?.isApproved == false
              ? articlePeddingList.add(e)
              : articleApprovedList.add(e))
          .toList();
      state = state.copyWith(
        // articlePeddingList: articlePeddingList,
        // articleApprovedList: articleApprovedList,
        status: LoadingStatus.success,
      );
    } catch (e) {
      state = state.copyWith(status: LoadingStatus.error);
      debugPrint('Admin Post Init: $e');
    }
  }

  
}
