import 'package:batru_house_rental/domain/entities/article/article_entity.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'owner_house_state.freezed.dart';

@freezed
class OwnerHouseState with _$OwnerHouseState {
  const factory OwnerHouseState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default([]) List<ArticleEntity> houseArticleList,
  }) = _OwnerHouseState;
}
