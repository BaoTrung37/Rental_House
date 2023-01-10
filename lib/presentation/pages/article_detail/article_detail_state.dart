import 'package:batru_house_rental/domain/entities/article/article_entity.dart';
import 'package:batru_house_rental/domain/entities/user/user_entity.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_detail_state.freezed.dart';

@freezed
class ArticleDetailState with _$ArticleDetailState {
  const factory ArticleDetailState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default(LoadingStatus.initial) LoadingStatus sendMessageStatus,
    @Default(LoadingStatus.initial) LoadingStatus removeHouseStatus,
    @Default(LoadingStatus.initial) LoadingStatus reportStatus,
    @Default('') String appError,
    @Default('') String appMessage,
    // @Default([]) List<ArticleEntity> houseArticleRelativeList,
    @Default('') String message,
    @Default('') String reportMessage,
    ArticleEntity? article,
    UserEntity? onwerHouse,
    @Default(false) isYourHouse,
    @Default(false) isFavorite,
    String? favoriteId,
    @Default(0) int largeQuantity,
    @Default(0) int normalQuantity,
    @Default(0) int smallQuantity,
  }) = _ArticleDetailState;
}
