import 'dart:io';

import 'package:batru_house_rental/domain/entities/article/article_entity.dart';
import 'package:batru_house_rental/domain/entities/commune/commune_entity.dart';
import 'package:batru_house_rental/domain/entities/convenient/convenient_entity.dart';
import 'package:batru_house_rental/domain/entities/convenient_house/convenient_house_entity.dart';
import 'package:batru_house_rental/domain/entities/district/district_entity.dart';
import 'package:batru_house_rental/domain/entities/house/house_entity.dart';
import 'package:batru_house_rental/domain/entities/image_house/image_house_entity.dart';
import 'package:batru_house_rental/domain/entities/province/province_entity.dart';
import 'package:batru_house_rental/domain/entities/type/type_entity.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_article_state.freezed.dart';

@freezed
class PostArticleState with _$PostArticleState {
  factory PostArticleState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default(0) int currentStep,
    @Default(false) bool isParkingSpaceAvailable,
    @Default([]) List<TypeEntity> types,
    @Default([]) List<ProvinceEntity> provinces,
    @Default([]) List<DistrictEntity> districts,
    @Default([]) List<CommuneEntity> communes,
    @Default([]) List<ConvenientEntity> convenients,
    @Default([]) List<ConvenientHouseEntity> convenientSelected,
    @Default([]) List<File> screenshotList,
    TypeEntity? currentType,
    ProvinceEntity? currentProvince,
    DistrictEntity? currentDistrict,
    CommuneEntity? currentCommune,
    HouseEntity? house,
    ImageHouseEntity? imageHouse,
    ArticleEntity? article,
  }) = _PostArticleState;
}
