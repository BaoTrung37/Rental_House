import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_response.g.dart';

@JsonSerializable()
class ArticleResponse {
  ArticleResponse({
    required this.id,
    required this.houseId,
    required this.userId,
    required this.title,
    required this.createdAt,
  });
  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);

  final String id;
  final String houseId;
  final String userId;
  final String title;
  final DateTime createdAt;

  Map<String, dynamic> toJson() => _$ArticleResponseToJson(this);
}
