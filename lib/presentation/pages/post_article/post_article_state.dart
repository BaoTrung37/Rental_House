import 'dart:io';

import 'package:batru_house_rental/domain/entities/commune/commune_entity.dart';
import 'package:batru_house_rental/domain/entities/convenient/convenient_entity.dart';
import 'package:batru_house_rental/domain/entities/district/district_entity.dart';
import 'package:batru_house_rental/domain/entities/province/province_entity.dart';
import 'package:batru_house_rental/domain/entities/type/type_entity.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_article_state.freezed.dart';

@freezed
class PostArticleState with _$PostArticleState {
  const factory PostArticleState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default(0) int currentStep,
    @Default(false) bool isParkingSpaceAvailable,
    @Default(TypeEntity) currentType,
    @Default(ProvinceEntity) currentProvince,
    @Default(DistrictEntity) currentDistrict,
    @Default(CommuneEntity) currentCommune,
    @Default([]) List<TypeEntity> types,
    @Default([]) List<ProvinceEntity> provinces,
    @Default([]) List<DistrictEntity> districts,
    @Default([]) List<CommuneEntity> communes,
    @Default([]) List<ConvenientEntity> convenients,
    @Default([]) List<ConvenientEntity> convenientsSelected,
    @Default([]) List<File> screenshotList,
    @Default(1) int houseAmount,
    @Default(1) int houseCapacity,
    @Default(1) int houseArea,
    @Default(0) int housePrice,
    @Default(0) int houseDepositPrice,
    @Default(0) int houseElectricityPrice,
    @Default(0) int houseWaterPrice,
    @Default(0) int houseInternetPrice,
    @Default(0) int housePackingPrice,
  }) = _PostArticleState;
}
