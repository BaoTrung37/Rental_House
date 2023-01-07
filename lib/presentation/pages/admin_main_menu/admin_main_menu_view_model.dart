import 'package:batru_house_rental/presentation/pages/admin_main_menu/admin_main_menu_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/admin_tab_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminMainMenuViewModel extends StateNotifier<AdminMainMenuState> {
  AdminMainMenuViewModel() : super(const AdminMainMenuState());

  void changeTab(int index) {
    state = state.copyWith(
      currentTab: AdminTabPage.values[index],
    );
  }

  void sendScrollRequest(AdminTabPage tab) {
    state = state.copyWith(
      scrollToTopRequestAtTabPage: tab,
    );
  }

  void clearScrollRequest() {
    state = state.copyWith(
      scrollToTopRequestAtTabPage: null,
    );
  }
}
