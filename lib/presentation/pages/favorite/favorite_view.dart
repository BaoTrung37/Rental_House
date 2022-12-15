import 'package:batru_house_rental/domain/use_case/auth/get_current_user_information_use_case.dart';
import 'package:batru_house_rental/domain/use_case/favorite/get_favorite_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/favorite/remove_favorite_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/pages/favorite/favorite_state.dart';
import 'package:batru_house_rental/presentation/pages/favorite/favorite_view_model.dart';
import 'package:batru_house_rental/presentation/pages/favorite/views/favorite_item_cell.dart';
import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _provider = StateNotifierProvider<FavoriteViewModel, FavoriteState>(
  (ref) => FavoriteViewModel(
    injector.get<GetFavoriteListUsecase>(),
    injector.get<GetCurrentUserInformationUseCase>(),
    injector.get<RemoveFavoriteUseCase>(),
  ),
);

class FavoriteView extends ConsumerStatefulWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends ConsumerState<FavoriteView> {
  FavoriteViewModel get _viewModel => ref.read(_provider.notifier);

  FavoriteState get _state => ref.watch(_provider);

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () {
      _viewModel.initData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar.titleOnly(title: 'Yêu thích'),
      body: Column(
        children: [
          Expanded(
            child: _buildFavoriteList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteList() {
    final favoriteList = _state.favoriteList;
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) => FavoriteItemCell(
        onTap: () {},
        onFavoriteTap: () {
          _viewModel.onFavoriteChanged(favoriteList[index].id);
        },
        favoriteEntity: favoriteList[index],
      ),
      itemCount: favoriteList.length,
    );
  }
}
