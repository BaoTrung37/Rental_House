import 'package:batru_house_rental/domain/entities/article/article_entity.dart';
import 'package:batru_house_rental/domain/entities/user/user_entity.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'house_detail_state.freezed.dart';

@freezed
class HouseDetailState with _$HouseDetailState {
  const factory HouseDetailState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default(LoadingStatus.initial) LoadingStatus sendMessageStatus,
    @Default(LoadingStatus.initial) LoadingStatus removeHouseStatus,
    @Default('') String appError,
    @Default([]) List<ArticleEntity> houseArticleRelativeList,
    @Default('') String message,
    ArticleEntity? article,
    UserEntity? onwerHouse,
    @Default(false) isYourHouse,
    @Default(false) isFavorite,
    String? favoriteId,
  }) = _HouseDetailState;
}
