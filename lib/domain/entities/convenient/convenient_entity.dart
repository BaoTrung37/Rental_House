import 'package:freezed_annotation/freezed_annotation.dart';

part 'convenient_entity.freezed.dart';

@freezed
class ConvenientEntity with _$ConvenientEntity {
  const factory ConvenientEntity({
    required String id,
    required String name,
    required String iconUrl,
    @Default(false) bool isSelected,
  }) = _ConvenientEntity;
}
