import 'package:batru_house_rental/data/providers/app_navigator_provider.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    // final currentUser = injector.get<AuthRepository>().user;
    // if (currentUser != null) {
    //   await ref.read(appNavigatorProvider).navigateTo(AppRoutes.mainMenu);
    // } else {
    //   await ref.read(appNavigatorProvider).navigateTo(AppRoutes.login);
    // }
    // });
    Future.delayed(const Duration(seconds: 2), () async {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          ref.read(appNavigatorProvider).navigateTo(AppRoutes.mainMenu);
        } else {
          ref.read(appNavigatorProvider).navigateTo(AppRoutes.login);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('SplashView'),
      ),
    );
  }
}
