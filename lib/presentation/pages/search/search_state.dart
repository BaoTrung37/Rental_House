import 'package:batru_house_rental/domain/entities/article/article_entity.dart';
import 'package:batru_house_rental/domain/entities/commune/commune_entity.dart';
import 'package:batru_house_rental/domain/entities/district/district_entity.dart';
import 'package:batru_house_rental/domain/entities/province/province_entity.dart';
import 'package:batru_house_rental/domain/entities/type/type_entity.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:batru_house_rental/presentation/utilities/enums/price_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default([]) List<TypeEntity> types,
    @Default([]) List<ProvinceEntity> provinces,
    @Default([]) List<DistrictEntity> districts,
    @Default([]) List<CommuneEntity> communes,
    @Default([]) List<ArticleEntity> articles,
    @Default([]) List<String> minPriceFilter,
    @Default([]) List<String> maxPriceFilter,
    PriceFilter? minPrice,
    PriceFilter? maxPrice,
    TypeEntity? currentType,
    ProvinceEntity? currentProvince,
    DistrictEntity? currentDistrict,
    CommuneEntity? currentCommune,
  }) = _SearchState;
}
