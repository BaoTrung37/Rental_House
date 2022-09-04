import 'package:batru_house_rental/injection/app_modules.dart';

class DependencyManager {
  static Future<void> inject() async {
    // App modules
    await AppModules.inject();
  }
}
