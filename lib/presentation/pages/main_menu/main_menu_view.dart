import 'package:batru_house_rental/data/providers/chat_navigator_provider.dart';
import 'package:batru_house_rental/data/providers/favorite_navigator_provider.dart';
import 'package:batru_house_rental/data/providers/home_navigator_provider.dart';
import 'package:batru_house_rental/data/providers/main_menu_navigator_provider.dart';
import 'package:batru_house_rental/data/providers/mypage_navigator_provider.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/navigation/chat_navigator_view.dart';
import 'package:batru_house_rental/presentation/navigation/favorite_navigator_view.dart';
import 'package:batru_house_rental/presentation/navigation/home_navigator_view.dart';
import 'package:batru_house_rental/presentation/navigation/mypage_navigator_view.dart';
import 'package:batru_house_rental/presentation/pages/main_menu/main_menu_state.dart';
import 'package:batru_house_rental/presentation/pages/main_menu/main_menu_view_model.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:batru_house_rental/presentation/utilities/enums/tab_page.dart';
import 'package:batru_house_rental/presentation/widgets/app_will_pop_scope.dart';
import 'package:batru_house_rental/presentation/widgets/snack_bar/error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainMenuView extends ConsumerStatefulWidget {
  const MainMenuView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainMenuViewState();
}

class _MainMenuViewState extends ConsumerState<MainMenuView>
    with WidgetsBindingObserver {
  late final _pageController = PageController();
  final double _navigationIconSize = 20;

  MainMenuViewModel get _viewModel => ref.read(mainMenuProvider.notifier);

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mainMenuProvider);

    ref.listen<MainMenuState>(mainMenuProvider,
        (MainMenuState? previousState, MainMenuState newState) {
      if (newState.currentTab != previousState?.currentTab) {
        _pageController.jumpToPage(newState.currentTab.index);
      }
      if (newState.status == LoadingStatus.error) {
        showErrorSnackBar(
          context: context,
          errorMessage: newState.errorMessage,
        );
      }
    });
    return AppWillPopScope(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: _buildPages(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: state.currentTab.index,
          items: _buildBottomNavigationBarItems(context),
          onTap: (index) {
            _onChangeTab(index, state.currentTab);
          },
        ),
      ),
    );
  }

  List<Widget> _buildPages() {
    return TabPage.values.map((tab) {
      switch (tab) {
        case TabPage.home:
          return const HomeNavigatorView();
        case TabPage.favorite:
          return const FavoriteNavigatorView();
        case TabPage.chat:
          return const ChatNavigatorView();
        case TabPage.myPage:
          return const MyPageNavigatorView();
      }
    }).toList();
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems(
    BuildContext context,
  ) {
    Widget _buildIcon(
      TabPage tab, {
      bool isSelected = false,
    }) {
      return _buildNavigationIcon(
        icon: tab.icon(
          context,
          size: _navigationIconSize,
          isSelected: isSelected,
        ),
      );
    }

    return TabPage.values
        .map(
          (e) => BottomNavigationBarItem(
            icon: _buildIcon(e),
            label: e.title,
            activeIcon: _buildIcon(e, isSelected: true),
          ),
        )
        .toList();
  }

  Widget _buildNavigationIcon({
    required Widget icon,
  }) {
    return SizedBox(
      width: _navigationIconSize + 4.42 * 2,
      height: _navigationIconSize + 2.5 * 2,
      child: icon,
    );
  }

  Future _onChangeTab(int index, TabPage tab) async {
    if (index == tab.index) {
      switch (tab) {
        case TabPage.home:
          ref.read(homeNavigatorProvider).popUntil(
                routeName: AppRoutes.home,
              );
          break;
        case TabPage.favorite:
          ref.read(favoriteNavigatorProvider).popUntil(
                routeName: AppRoutes.favorite,
              );
          break;
        case TabPage.chat:
          ref.read(chatNavigatorProvider).popUntil(
                routeName: AppRoutes.chat,
              );
          break;
        case TabPage.myPage:
          ref.read(myPageNavigatorProvider).popUntil(
                routeName: AppRoutes.myPage,
              );
          break;
      }
      _viewModel.sendScrollRequest(tab);
    } else {
      _viewModel.changeTab(index);
    }
  }
}
