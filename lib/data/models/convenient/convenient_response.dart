import 'package:freezed_annotation/freezed_annotation.dart';

part 'convenient_response.g.dart';

@JsonSerializable()
class ConvenientResponse {
  ConvenientResponse({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
  factory ConvenientResponse.fromJson(Map<String, dynamic> json) =>
      _$ConvenientResponseFromJson(json);
  final String id;
  final String name;
  final String imageUrl;
  Map<String, dynamic> toJson() => _$ConvenientResponseToJson(this);
}
