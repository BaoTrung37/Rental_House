import 'package:freezed_annotation/freezed_annotation.dart';

part 'convenient_response.g.dart';

@JsonSerializable()
class ConvenientResponse {
  ConvenientResponse({
    required this.id,
    required this.iconUrl,
    required this.name,
  });
  factory ConvenientResponse.fromJson(Map<String, dynamic> json) =>
      _$ConvenientResponseFromJson(json);
  final String id;
  final String iconUrl;
  final String name;

  Map<String, dynamic> toJson() => _$ConvenientResponseToJson(this);
}
