import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_post_entity.freezed.dart';

@freezed
class ChatPostEntity with _$ChatPostEntity {
  const factory ChatPostEntity({
    required String id,
    required String postId,
    required String userId,
    required String typeHouse,
    required String title,
    required String url,
    required int rentalPrice,
    required String address,
  }) = _ChatPostEntity;
}
