import 'package:batru_house_rental/presentation/pages/main_menu/main_menu_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/tab_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainMenuViewModel extends StateNotifier<MainMenuState> {
  MainMenuViewModel() : super(const MainMenuState());

  void changeTab(int index) {
    state = state.copyWith(
      currentTab: TabPage.values[index],
    );
  }

  void sendScrollRequest(TabPage tab) {
    state = state.copyWith(scrollToTopRequestAtTabPage: tab);
  }

  void clearScrollRequest() {
    state = state.copyWith(scrollToTopRequestAtTabPage: null);
  }
}
