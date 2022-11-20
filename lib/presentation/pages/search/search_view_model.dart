import 'package:batru_house_rental/domain/use_case/article/get_article_filter_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/commune/get_commune_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/district/get_district_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/province/get_province_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/type/get_type_list_use_case.dart';
import 'package:batru_house_rental/presentation/pages/search/search_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchViewModel extends StateNotifier<SearchState> {
  SearchViewModel(
    this._getTypeListUseCase,
    this._getProvinceListUseCase,
    this._getDistrictListUseCase,
    this._getCommuneListUseCase,
    this._getArticleFilterListUseCase,
  ) : super(const SearchState());

  final GetTypeListUseCase _getTypeListUseCase;
  final GetProvinceListUseCase _getProvinceListUseCase;
  final GetDistrictListUseCase _getDistrictListUseCase;
  final GetCommuneListUseCase _getCommuneListUseCase;
  final GetArticleFilterListUseCase _getArticleFilterListUseCase;

  Future<void> initData(String districtId) async {
    try {
      state = state.copyWith(status: LoadingStatus.inProgress);
      final provinces = await _getProvinceListUseCase.run();
      final types = await _getTypeListUseCase.run();
      final districts = await _getDistrictListUseCase.run('01');
      final communes = await _getCommuneListUseCase.run(districtId);

      await _getDistrictInitial(districtId);
      final articles = await _getArticleFilterListUseCase.run(
        ArticleFilterInput(
          districtId: districtId,
        ),
      );

      state = state.copyWith(
        provinces: provinces,
        districts: districts,
        types: types,
        articles: articles,
        communes: communes,
        status: LoadingStatus.success,
      );
    } catch (e) {
      debugPrint('Search view: $e');
      state = state.copyWith(
        status: LoadingStatus.error,
      );
    }
  }

  Future<void> getArticleFilterList() async {
    try {
      state = state.copyWith(status: LoadingStatus.inProgress);
      final articles = await _getArticleFilterListUseCase.run(
        ArticleFilterInput(
          districtId: state.currentDistrict?.id,
          communeId: state.currentCommune?.id,
          typeId: state.currentType?.id,
        ),
      );
      state = state.copyWith(
        articles: articles,
        status: LoadingStatus.success,
      );
    } catch (e) {
      debugPrint('Search view: $e');
      state = state.copyWith(
        status: LoadingStatus.error,
      );
    }
  }

  Future<void> _getDistrictInitial(String districtId) async {
    final districts = await _getDistrictListUseCase.run('01');
    state = state.copyWith(
      currentDistrict: districts.firstWhere(
        (e) => e.id == districtId,
      ),
    );
  }

  Future<void> onTypeChanged(String type) async {
    state = state.copyWith(
      currentType: state.types.firstWhere(
        (e) => e.name == type,
      ),
    );
  }

  Future<void> onCommuneChanged(String? communeName) async {
    state = state.copyWith(
      currentCommune: state.communes.firstWhereOrNull(
        (e) => e.name == communeName,
      ),
    );
  }

  Future<void> onDistrictChanged(String? districtName) async {
    state = state.copyWith(
      currentDistrict: state.districts.firstWhereOrNull(
        (e) => e.name == districtName,
      ),
      currentCommune: null,
    );
    if (state.currentDistrict != null) {
      final communes =
          await _getCommuneListUseCase.run(state.currentDistrict!.id);
      state = state.copyWith(
        communes: communes,
      );
    }
  }
}
