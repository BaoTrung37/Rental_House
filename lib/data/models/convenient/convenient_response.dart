import 'package:batru_house_rental/domain/entities/convenient/convenient_entity.dart';
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

  ConvenientEntity toEntity() => ConvenientEntity(
        id: id,
        iconUrl: iconUrl,
        name: name,
      );
}
