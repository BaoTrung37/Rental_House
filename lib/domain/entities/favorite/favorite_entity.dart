import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_entity.freezed.dart';

@freezed
class FavoriteEntity with _$FavoriteEntity {
  const factory FavoriteEntity({
    required String id,
    required String postId,
    required String userId,
    required String typeHouse,
    required String title,
    required String url,
    required int rentalPrice,
    required String address,
    @Default(true) isFavorite,
  }) = _FavoriteEntity;
}
