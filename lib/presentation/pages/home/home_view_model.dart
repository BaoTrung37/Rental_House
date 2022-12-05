import 'package:batru_house_rental/domain/use_case/article/get_article_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/district/get_district_list_use_case.dart';
import 'package:batru_house_rental/presentation/pages/home/home_state.dart';
import 'package:batru_house_rental/presentation/pages/home/views/info_room_item_cell.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:batru_house_rental/presentation/widgets/infinite_list/infinite_list_view.dart';
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
      final articles = await _getArticleListUseCase.run(20);
      state = state.copyWith(
        famousDistrictList: districts.take(6).toList(),
        houseArticleList: articles,
        status: LoadingStatus.success,
      );
    } catch (e) {
      state = state.copyWith(
        status: LoadingStatus.error,
        appError: e.toString(),
      );
      debugPrint('home view: $e');
    }
  }

  Future<List<Datasource>> getArticleList(int limit) async {
    try {
      state = state.copyWith(
        status: LoadingStatus.inProgress,
      );
      final items = state.houseArticleList.getRange(0, 5).toList();
      debugPrint(items.length.toString());
      if (items.isNotEmpty) {
        final datasource = items
            .map<Datasource>((e) => RoomInfoItemCell(
                  RoomInfoData(
                    articleEntity: e,
                  ),
                ))
            .toList();
        state = state.copyWith(
          status: LoadingStatus.success,
        );
        return datasource;
      }
    } catch (e) {
      debugPrint(e.toString());
      state = state.copyWith(
        status: LoadingStatus.error,
      );
      rethrow;
    }
    return [];
  }

  Future<void> refreshData() async {
    try {
      state = state.copyWith(
        status: LoadingStatus.inProgress,
      );
      final articles = await _getArticleListUseCase.run(10);
      state = state.copyWith(
        houseArticleList: articles,
        status: LoadingStatus.success,
      );
    } catch (e) {
      state = state.copyWith(
        status: LoadingStatus.error,
        appError: e.toString(),
      );
      debugPrint('home view: $e');
    }
  }

  void setShouldReloadData(bool value) {
    state = state.copyWith(
      shouldReLoadData: value,
    );
  }
}
