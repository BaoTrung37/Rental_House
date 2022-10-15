import 'package:batru_house_rental/domain/use_case/article/get_article_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/district/get_district_list_use_case.dart';
import 'package:batru_house_rental/presentation/pages/home/home_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel(
    this._getDistrictListUseCase,
    this._getArticleListUseCase,
  ) : super(const HomeState());

  final GetDistrictListUseCase _getDistrictListUseCase;
  final GetArticleListUseCase _getArticleListUseCase;
  Future<void> initData() async {
    try {
      state = state.copyWith(
        status: LoadingStatus.inProgress,
      );
      final districts = await _getDistrictListUseCase.run('01');
      final articles = await _getArticleListUseCase.run(10);
      // debugPrint('districts: $districts.length');
      state = state.copyWith(
        famousDistrictList: districts.take(6).toList(),
        status: LoadingStatus.success,
      );
    } catch (e) {
      state = state.copyWith(
        status: LoadingStatus.error,
      );
      debugPrint(e.toString());
    }
  }
}
