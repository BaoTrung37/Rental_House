import 'package:batru_house_rental/domain/entities/article/article_entity.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'owner_article_state.freezed.dart';

@freezed
class OwnerArticleState with _$OwnerArticleState {
  const factory OwnerArticleState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default([]) List<ArticleEntity> articlePeddingList,
    @Default([]) List<ArticleEntity> articleApprovedList,
  }) = _OwnerArticleState;
}
