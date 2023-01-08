import 'package:batru_house_rental/domain/entities/article/article_entity.dart';
import 'package:batru_house_rental/domain/entities/user/user_entity.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_article_detail_state.freezed.dart';

@freezed
class AdminArticleDetailState with _$AdminArticleDetailState {
  const factory AdminArticleDetailState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default(LoadingStatus.initial) LoadingStatus browsePostStatus,
    @Default(LoadingStatus.initial) LoadingStatus removeHouseStatus,
    @Default('') String appError,
    @Default('') String appMessage,
    ArticleEntity? article,
    UserEntity? onwerHouse,
    @Default(0) int largeQuantity,
    @Default(0) int normalQuantity,
    @Default(0) int smallQuantity,
  }) = _AdminArticleDetailState;
}
