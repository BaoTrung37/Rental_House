import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_entity.freezed.dart';

@freezed
class ArticleEntity with _$ArticleEntity {
  const factory ArticleEntity({
    required String id,
    required String title,
    required String phoneNumber,
    required String description,
    required String houseId,
    required String userId,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _ArticleEntity;
}
