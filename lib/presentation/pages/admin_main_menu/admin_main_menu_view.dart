import 'package:batru_house_rental/data/providers/admin_main_menu_navigator_provider.dart';
import 'package:batru_house_rental/data/providers/chat_navigator_provider.dart';
import 'package:batru_house_rental/data/providers/favorite_navigator_provider.dart';
import 'package:batru_house_rental/data/providers/home_navigator_provider.dart';
import 'package:batru_house_rental/data/providers/mypage_navigator_provider.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/navigation/chat_navigator_view.dart';
import 'package:batru_house_rental/presentation/navigation/mypage_navigator_view.dart';
import 'package:batru_house_rental/presentation/pages/admin_main_menu/admin_main_menu_state.dart';
import 'package:batru_house_rental/presentation/pages/admin_main_menu/admin_main_menu_view_model.dart';
import 'package:batru_house_rental/presentation/pages/admin_post/admin_post_view.dart';
import 'package:batru_house_rental/presentation/pages/admin_report/admin_report_view.dart';
import 'package:batru_house_rental/presentation/utilities/enums/admin_tab_page.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:batru_house_rental/presentation/widgets/app_will_pop_scope.dart';
import 'package:batru_house_rental/presentation/widgets/snack_bar/error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminMainMenuView extends ConsumerStatefulWidget {
  const AdminMainMenuView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdminMainMenuViewState();
}

class _AdminMainMenuViewState extends ConsumerState<AdminMainMenuView>
    with WidgetsBindingObserver {
  late final _pageController = PageController();
  final double _navigationIconSize = 20;

  AdminMainMenuViewModel get _viewModel =>
      ref.read(adminMainMenuProvider.notifier);
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(adminMainMenuProvider);

    ref.listen<AdminMainMenuState>(adminMainMenuProvider,
        (AdminMainMenuState? previousState, AdminMainMenuState newState) {
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
    return AdminTabPage.values.map((tab) {
      switch (tab) {
        case AdminTabPage.post:
          return const AdminPostView();
        case AdminTabPage.report:
          return const AdminReportView();
        case AdminTabPage.chat:
          return const ChatNavigatorView();
        case AdminTabPage.myPage:
          return const MyPageNavigatorView();
      }
    }).toList();
  }

  Widget _buildIcon(
    AdminTabPage tab, {
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

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems(
    BuildContext context,
  ) {
    return AdminTabPage.values
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

  Future _onChangeTab(int index, AdminTabPage tab) async {
    if (index == tab.index) {
      switch (tab) {
        case AdminTabPage.post:
          ref.read(homeNavigatorProvider).popUntil(
                routeName: AppRoutes.adminPost,
              );
          break;
        case AdminTabPage.report:
          ref.read(favoriteNavigatorProvider).popUntil(
                routeName: AppRoutes.adminReport,
              );
          break;
        case AdminTabPage.chat:
          ref.read(chatNavigatorProvider).popUntil(
                routeName: AppRoutes.chat,
              );
          break;
        case AdminTabPage.myPage:
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
