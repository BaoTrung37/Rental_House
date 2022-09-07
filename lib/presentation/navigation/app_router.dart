import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/pages/home/home_view.dart';
import 'package:batru_house_rental/presentation/pages/splash/splash_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static bool _isInitialRouteCalled = false;

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    debugPrint('----> Navigate to route: ${settings.name}');

    switch (settings.name) {
      case AppRoutes.splash:
        _isInitialRouteCalled = true;

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SplashView(),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomeView(),
        );

      case AppRoutes.empty:
        // When app runs first time, it always pushes an empty route ("/")
        // and throw an exception if an empty route has no page
        // ref: https://docs.flutter.dev/development/ui/navigation/deep-linking
        // Only show empty screen at the first time

        if (_isInitialRouteCalled) {
          return null;
        }

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Container(
              // color: context.colors.backgroundPrimary,
              ),
        );
      default:
        return null;
    }
  }
}
