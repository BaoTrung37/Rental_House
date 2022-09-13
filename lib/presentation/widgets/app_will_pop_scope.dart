import 'dart:io';

import 'package:batru_house_rental/data/providers/app_navigator_provider.dart';
import 'package:batru_house_rental/presentation/navigation/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppWillPopScope extends ConsumerWidget {
  const AppWillPopScope({
    required this.child,
    this.onWillPop,
    this.navigator,
    Key? key,
  }) : super(key: key);

  final Widget child;

  final WillPopCallback? onWillPop;

  /// If navigator null, auto use root navigator by default
  final AppNavigator? navigator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: onWillPop ?? () => _onWillPop(ref),
      child: child,
    );
  }

  Future<bool> _onWillPop(WidgetRef ref) async {
    if (Platform.isAndroid) {
      final rootNavigator = ref.read(appNavigatorProvider);
      final currentNavigator = navigator ?? rootNavigator;

      // Make navigation for sub navigator
      if (currentNavigator != rootNavigator && currentNavigator.canGoBack()) {
        currentNavigator.goBack();
        return false;
      }
    }

    return true;
  }
}
