import 'dart:async';

import 'package:batru_house_rental/injection/app_modules.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/app.dart';
import 'package:batru_house_rental/presentation/utilities/initialize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Sets screen orientation only Portrait
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  Future<void> startApp() async {
    await Initialize.initializationSetup();
    // Dependency
    await AppModules.inject();
    await injector.allReady();

    runApp(
      const App(),
    );
  }

  runZonedGuarded(() {
    startApp();
  }, (Object error, StackTrace stackTrace) {});
}
