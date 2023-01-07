import 'package:batru_house_rental/presentation/utilities/enums/admin_tab_page.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_main_menu_state.freezed.dart';

@freezed
class AdminMainMenuState with _$AdminMainMenuState {
  const factory AdminMainMenuState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    AdminTabPage? tabPageWithRequiredConditionsToChange,
    @Default(AdminTabPage.post) AdminTabPage currentTab,
    AdminTabPage? scrollToTopRequestAtTabPage,
    @Default('') String errorMessage,
  }) = _AdminMainMenuState;
}
