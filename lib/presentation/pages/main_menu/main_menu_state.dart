import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:batru_house_rental/presentation/utilities/enums/tab_page.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_menu_state.freezed.dart';

@freezed
class MainMenuState with _$MainMenuState {
  const factory MainMenuState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    TabPage? tabPageWithRequiredConditionsToChange,
    @Default(TabPage.home) TabPage currentTab,
    TabPage? scrollToTopRequestAtTabPage,
    @Default('') String errorMessage,
  }) = _MainMenuState;
}
