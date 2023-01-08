import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_house_entity.freezed.dart';

@freezed
class ImageHouseEntity with _$ImageHouseEntity {
  const factory ImageHouseEntity({
    required String id,
    required String url,
    required String postId,
  }) = _ImageHouseEntity;
}
