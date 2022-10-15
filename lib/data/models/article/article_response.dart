import 'package:batru_house_rental/data/utilities/common/json_date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_response.g.dart';

@JsonDateTimeConverter()
@JsonSerializable()
class ArticleResponse {
  ArticleResponse({
    required this.id,
    required this.houseId,
    required this.userId,
    required this.title,
    required this.description,
    required this.phoneNumber,
    required this.createdAt,
    this.updatedAt,
  });
  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);

  final String id;
  final String houseId;
  final String userId;
  final String title;
  final String description;
  final String phoneNumber;
  final DateTime createdAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toJson() => _$ArticleResponseToJson(this);
}
