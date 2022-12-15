import 'package:batru_house_rental/domain/entities/favorite/favorite_entity.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_state.freezed.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default([]) List<FavoriteEntity> favoriteList,
  }) = _FavoriteState;
}
