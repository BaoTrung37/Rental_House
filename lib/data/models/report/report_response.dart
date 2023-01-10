import 'package:batru_house_rental/data/utilities/common/json_date_time_converter.dart';
import 'package:batru_house_rental/domain/entities/report/report_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_response.g.dart';

@JsonSerializable()
@JsonDateTimeConverter()
class ReportResponse {
  ReportResponse({
    required this.id,
    required this.title,
    required this.postId,
    required this.reason,
    required this.createdAt,
  });
  factory ReportResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportResponseFromJson(json);

  final String id;
  final String title;
  final String postId;
  final String reason;
  final DateTime createdAt;

  Map<String, dynamic> toJson() => _$ReportResponseToJson(this);

  ReportEntity toEntity() => ReportEntity(
        id: id,
        title: title,
        postId: postId,
        reason: reason,
        createdAt: createdAt,
      ); 
}
