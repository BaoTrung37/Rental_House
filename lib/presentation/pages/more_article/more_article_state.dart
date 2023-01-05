import 'package:batru_house_rental/domain/entities/article/article_entity.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'more_article_state.freezed.dart';

@freezed
class MoreArticleState with _$MoreArticleState {
  const factory MoreArticleState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default([]) List<ArticleEntity> articleList,
  }) = _MoreArticleState;
}
