import 'package:batru_house_rental/domain/use_case/article/get_article_filter_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/commune/get_commune_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/district/get_district_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/province/get_province_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/type/get_type_list_use_case.dart';
import 'package:batru_house_rental/presentation/pages/search/search_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
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
      state = state.copyWith(status: LoadingStatus.initial);
      final provinces = await _getProvinceListUseCase.run();
      final types = await _getTypeListUseCase.run();
      final districts = await _getDistrictListUseCase.run('01');
      final communes = await _getCommuneListUseCase.run(districtId);
      await _getDistrictInitial(districtId);

      state = state.copyWith(
        provinces: provinces,
        districts: districts,
        types: types,
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

  Future<void> getArticleFilterList(String districtId) async {
    try {
      state = state.copyWith(status: LoadingStatus.initial);
      // final articles = await _getArticleFilterListUseCase.run(districtId);
      state = state.copyWith(
        // articles: articles,
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

  Future<void> onCommuneChanged(String communeName) async {
    state = state.copyWith(
      currentCommune: state.communes.firstWhere(
        (e) => e.name == communeName,
      ),
    );
  }

  Future<void> onDistrictChanged(String districtName) async {
    state = state.copyWith(
      currentDistrict: state.districts.firstWhere(
        (e) => e.name == districtName,
      ),
      currentCommune: null,
    );
    final communes =
        await _getCommuneListUseCase.run(state.currentDistrict!.id);
    state = state.copyWith(
      communes: communes,
    );
  }
}
