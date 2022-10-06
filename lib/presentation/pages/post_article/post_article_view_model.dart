import 'package:batru_house_rental/domain/use_case/commune/get_commune_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/convenient/get_convenient_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/district/get_district_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/type/get_type_list_use_case.dart';
import 'package:batru_house_rental/presentation/pages/post_article/post_article_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostArticleViewModel extends StateNotifier<PostArticleState> {
  PostArticleViewModel(
    this._getTypeListUseCase,
    // this._getProvinceListUseCase,
    this._getDistrictListUseCase,
    this._getCommuneListUseCase,
    this._getConvenientListUseCase,
  ) : super(const PostArticleState());

  final GetTypeListUseCase _getTypeListUseCase;
  // final GetProvinceListUseCase _getProvinceListUseCase;
  final GetDistrictListUseCase _getDistrictListUseCase;
  final GetCommuneListUseCase _getCommuneListUseCase;
  final GetConvenientListUseCase _getConvenientListUseCase;
  Future<void> initData() async {
    try {
      state = state.copyWith(
        status: LoadingStatus.inProgress,
      );
      final convenients = await _getConvenientListUseCase.run();
      final types = await _getTypeListUseCase.run();
      final districts = await _getDistrictListUseCase.run('01');
      final communes = await _getCommuneListUseCase.run('001');
      state = state.copyWith(
        status: LoadingStatus.success,
        types: types,
        districts: districts,
        communes: communes,
        convenients: convenients,
      );
    } catch (e) {
      state = state.copyWith(
        status: LoadingStatus.error,
      );
      debugPrint(e.toString());
    }
  }

  void onConvenientTap(String convenientId) {
    state = state.copyWith(
        convenients: state.convenients.map((e) {
      if (e.id == convenientId) {
        return e.copyWith(isSelected: !e.isSelected);
      }
      return e;
    }).toList());
  }

  Future<void> onDistrictChanged(String districtName) async {
    state = state.copyWith(
      currentDistrict: state.districts.firstWhere(
        (e) => e.name == districtName,
      ),
    );
    final communes = await _getCommuneListUseCase.run(state.currentDistrict.id);
    state = state.copyWith(
      communes: communes,
    );
  }

  void onCommuneChanged(String communeName) {
    state = state.copyWith(
      currentDistrict: state.communes.firstWhere(
        (e) => e.name == communeName,
      ),
    );
  }

  void setStep(int step) {
    state = state.copyWith(currentStep: step);
  }

  void nextStep() {
    state = state.copyWith(
        currentStep:
            state.currentStep < 3 ? state.currentStep + 1 : state.currentStep);
  }

  void previousStep() {
    state = state.copyWith(
        currentStep:
            state.currentStep > 0 ? state.currentStep - 1 : state.currentStep);
  }

  void setIsParkingSpace(bool value) {
    state = state.copyWith(isParkingSpaceAvailable: value);
  }
}
