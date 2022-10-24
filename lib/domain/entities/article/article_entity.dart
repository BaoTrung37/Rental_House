import 'package:batru_house_rental/domain/entities/commune/commune_entity.dart';
import 'package:batru_house_rental/domain/entities/convenient/convenient_entity.dart';
import 'package:batru_house_rental/domain/entities/district/district_entity.dart';
import 'package:batru_house_rental/domain/entities/house/house_entity.dart';
import 'package:batru_house_rental/domain/entities/image_house/image_house_entity.dart';
import 'package:batru_house_rental/domain/entities/type/type_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_entity.freezed.dart';

@freezed
class ArticleEntity with _$ArticleEntity {
  const factory ArticleEntity({
    @Default('') String id,
    @Default([]) List<ImageHouseEntity> imageList,
    @Default([]) List<ConvenientEntity> convenientList,
    TypeEntity? type,
    HouseEntity? house,
    DistrictEntity? districtEntity,
    CommuneEntity? communeEntity,
  }) = _ArticleEntity;
}
