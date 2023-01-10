import 'package:batru_house_rental/domain/entities/article/article_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_entity.freezed.dart';

@freezed
class ReportEntity with _$ReportEntity {
  const factory ReportEntity({
    required String id,
    required String title,
    required String postId,
    required String reason,
    required DateTime createdAt,
    ArticleEntity? articleEntity,
  }) = _ReportEntity;
}
