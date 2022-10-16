import 'package:batru_house_rental/domain/entities/type/type_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_response.g.dart';

@JsonSerializable()
class TypeResponse {
  TypeResponse({
    required this.id,
    required this.name,
  });
  factory TypeResponse.fromJson(Map<String, dynamic> json) =>
      _$TypeResponseFromJson(json);

  final String id;
  final String name;

  Map<String, dynamic> toJson() => _$TypeResponseToJson(this);

  TypeEntity toEntity() => TypeEntity(
        id: id,
        name: name,
      );
}
