// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:batru_house_rental/domain/use_case/auth/get_current_user_information_use_case.dart';
import 'package:batru_house_rental/domain/use_case/favorite/get_favorite_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/favorite/remove_favorite_use_case.dart';
import 'package:batru_house_rental/presentation/pages/favorite/favorite_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteViewModel extends StateNotifier<FavoriteState> {
  FavoriteViewModel(
    this._getFavoriteListUsecase,
    this._getCurrentUserInformationUseCase,
    this._removeFavoriteUseCase,
  ) : super(const FavoriteState());

  final GetFavoriteListUsecase _getFavoriteListUsecase;
  final GetCurrentUserInformationUseCase _getCurrentUserInformationUseCase;
  final RemoveFavoriteUseCase _removeFavoriteUseCase;

  Future<void> initData() async {
    try {
      state = state.copyWith(status: LoadingStatus.inProgress);
      final currentUser = await _getCurrentUserInformationUseCase.run();
      final favoriteList = await _getFavoriteListUsecase.run(currentUser.id);
      state = state.copyWith(
        favoriteList: favoriteList,
        status: LoadingStatus.success,
      );
    } catch (e) {
      state = state.copyWith(
        status: LoadingStatus.error,
      );
    }
  }

  Future<void> onFavoriteChanged(String id) async {
    final favoriteList = state.favoriteList.where((e) => e.id != id).toList();
    await _removeFavoriteUseCase.run(id);
    state = state.copyWith(
      favoriteList: favoriteList,
    );
  }
}
