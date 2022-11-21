import 'package:batru_house_rental/domain/use_case/article/get_articles_by_user_id_use_case.dart';
import 'package:batru_house_rental/presentation/pages/owner_house/owner_house_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OwnerHouseViewModel extends StateNotifier<OwnerHouseState> {
  OwnerHouseViewModel(
    this._getArticlesByUserIdUseCase,
  ) : super(const OwnerHouseState());

  final GetArticlesByUserIdUseCase _getArticlesByUserIdUseCase;
  Future<void> initData(String userId) async {
    try {
      state = state.copyWith(status: LoadingStatus.inProgress);
      final houseArticleList = await _getArticlesByUserIdUseCase.run(userId);
      state = state.copyWith(
        houseArticleList: houseArticleList,
        status: LoadingStatus.success,
      );
    } catch (e) {
      state = state.copyWith(status: LoadingStatus.error);
      debugPrint('Owner House: $e');
    }
  }
}
