import 'package:flutter/material.dart';

enum AppNavigatorStackAction {
  /// Keep all of stacks
  keep,

  /// Replace last stack
  replace,

  /// Remove all stacks
  removeAll,
}

class AppNavigator {
  final navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(
    String routeName, {
    dynamic arguments,
    bool shoulClearStack = false,
  }) async {
    final currentState = navigatorKey.currentState;
    if (currentState == null) {
      return false;
    }
    if (shoulClearStack) {
      return currentState.pushNamedAndRemoveUntil(
        routeName,
        (route) => false,
        arguments: arguments,
      );
    }
    return currentState.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  BuildContext? getContext() {
    final currentState = navigatorKey.currentState;
    return currentState?.context;
  }

  void goBack({
    dynamic arguments,
  }) {
    final currentState = navigatorKey.currentState;
    if (currentState == null) {
      return;
    }
    return currentState.pop(arguments);
  }

  bool canGoBack() {
    final currentState = navigatorKey.currentState;
    if (currentState == null) {
      return false;
    }
    return currentState.canPop();
  }

  /// Removes all the screens on the stack until the given route name
  ///
  void popUntil({
    required String routeName,
  }) {
    final currentState = navigatorKey.currentState;
    if (currentState == null) {
      return;
    }

    final isCurrent = _isCurrent(
      routeName,
      currentState,
    );

    if (!isCurrent) {
      currentState.popUntil((route) => route.settings.name == routeName);
    }
  }

  bool _isCurrent(
    String routeName,
    NavigatorState currentState,
  ) {
    var isCurrent = false;

    currentState.popUntil((route) {
      if (route.settings.name == routeName) {
        isCurrent = true;
      }
      return true;
    });
    return isCurrent;
  }

  // Events

  // Future<void> logout() async {
  //   debugPrint('Logout -----');
    // await injector.get<ClearWhenLogoutSharedPreferencesUseCase>().run();
  //   await navigateTo(
  //     AppRoutes.login,
  //     shouldClearStack: true,
  //   );
  // }
}
