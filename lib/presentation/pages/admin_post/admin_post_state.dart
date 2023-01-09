import 'package:batru_house_rental/domain/entities/article/article_entity.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_post_state.freezed.dart';

@freezed
class AdminPostState with _$AdminPostState {
  const factory AdminPostState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default([]) List<ArticleEntity> articlePeddingList,
    @Default([]) List<ArticleEntity> articleApprovedList,
    @Default(false) bool shouldReLoadData,
    @Default('') appError,
  }) = _AdminPostState;
}
