// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:batru_house_rental/domain/use_case/article/get_approved_article_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/article/get_pendding_article_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/email_logout_use_case.dart';
import 'package:batru_house_rental/presentation/pages/admin_post/admin_post_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminPostViewModel extends StateNotifier<AdminPostState> {
  AdminPostViewModel(
    this._getApprovedArticleListUseCase,
    this._getPenddingArticleListUseCase,
    this._emaillogoutUseCase,
  ) : super(const AdminPostState());

  final GetApprovedArticleListUseCase _getApprovedArticleListUseCase;
  final GetPenddingArticleListUseCase _getPenddingArticleListUseCase;
  final EmailLogoutUseCase _emaillogoutUseCase;

  Future<void> initData() async {
    try {
      state = state.copyWith(status: LoadingStatus.inProgress);

      final articlePeddingList = await _getPenddingArticleListUseCase.run(1);
      final articleApprovedList = await _getApprovedArticleListUseCase.run(1);

      state = state.copyWith(
        articlePeddingList: articlePeddingList,
        articleApprovedList: articleApprovedList,
        status: LoadingStatus.success,
      );
    } catch (e) {
      state = state.copyWith(status: LoadingStatus.error);
      debugPrint('Admin Post Init: $e');
    }
  }

  Future<void> logout(VoidCallback? action) async {
    state = state.copyWith(
      status: LoadingStatus.inProgress,
    );
    try {
      await _emaillogoutUseCase.run();
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
