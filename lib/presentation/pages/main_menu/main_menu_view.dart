import 'package:batru_house_rental/presentation/pages/home/home_view.dart';
import 'package:batru_house_rental/presentation/utilities/enums/tab_page.dart';
import 'package:batru_house_rental/presentation/widgets/app_will_pop_scope.dart';
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

  @override
  Widget build(BuildContext context) {
    return AppWillPopScope(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: _buildPages(),
        ),
      ),
    );
  }

  List<Widget> _buildPages() {
    return TabPage.values.map((tab) {
      switch (tab) {
        case TabPage.home:
          return const HomeView();
        case TabPage.favorite:
          // TODO: Handle this case.
          return const HomeView();
        case TabPage.chat:
          // TODO: Handle this case.
          return const HomeView();
        case TabPage.myPage:
          // TODO: Handle this case.
          return const HomeView();
      }
    }).toList();
  }
}
