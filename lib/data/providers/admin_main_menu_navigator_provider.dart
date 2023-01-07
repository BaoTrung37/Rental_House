import 'package:batru_house_rental/presentation/pages/admin_main_menu/admin_main_menu_state.dart';
import 'package:batru_house_rental/presentation/pages/admin_main_menu/admin_main_menu_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final adminMainMenuProvider = StateNotifierProvider.autoDispose<
    AdminMainMenuViewModel, AdminMainMenuState>(
  (ref) => AdminMainMenuViewModel(),
);
