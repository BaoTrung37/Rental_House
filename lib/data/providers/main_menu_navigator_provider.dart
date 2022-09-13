import 'package:batru_house_rental/presentation/pages/main_menu/main_menu_state.dart';
import 'package:batru_house_rental/presentation/pages/main_menu/main_menu_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainMenuProvider =
    StateNotifierProvider.autoDispose<MainMenuViewModel, MainMenuState>(
  (ref) => MainMenuViewModel(),
);
