import 'package:batru_house_rental/domain/use_case/article/get_article_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/article/get_article_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/get_user_by_id_use_case.dart';
import 'package:batru_house_rental/presentation/pages/house_detail/house_detail_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HouseDetailViewModel extends StateNotifier<HouseDetailState> {
  HouseDetailViewModel(
    this._getArticleUseCase,
    this._getUserByIdUseCase,
    this._getArticleListUseCase,
  ) : super(const HouseDetailState());

  final GetArticleUseCase _getArticleUseCase;
  final GetUserByIdUseCase _getUserByIdUseCase;
  final GetArticleListUseCase _getArticleListUseCase;
  Future<void> init(String houseId) async {
    try {
      state = state.copyWith(status: LoadingStatus.initial);
      final article = await _getArticleUseCase.run(houseId);
      final ownerHouse = await _getUserByIdUseCase.run(article.house!.userId);
      final houseArticleRelativeList = await _getArticleListUseCase.run(10);
      state = state.copyWith(
        article: article,
        onwerHouse: ownerHouse,
        houseArticleRelativeList: houseArticleRelativeList,
        status: LoadingStatus.success,
      );
    } catch (e) {
      state = state.copyWith(status: LoadingStatus.error);
      debugPrint('House detail: $e');
    }
  }
}
