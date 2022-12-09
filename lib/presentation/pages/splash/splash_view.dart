import 'package:batru_house_rental/data/providers/app_navigator_provider.dart';
import 'package:batru_house_rental/domain/use_case/article/get_initial_article_data_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/pages/splash/splash_state.dart';
import 'package:batru_house_rental/presentation/pages/splash/splash_view_model.dart';
import 'package:batru_house_rental/presentation/resources/app_images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _provider =
    StateNotifierProvider.autoDispose<SplashViewModel, SplashState>(
  (ref) => SplashViewModel(
    injector.get<GetInitialArticleDataUseCase>(),
  ),
);

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  SplashViewModel get _viewModel => ref.read(_provider.notifier);

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {
      _viewModel.initData();
    });
    Future.delayed(const Duration(seconds: 3), () async {
      FirebaseAuth.instance.authStateChanges().listen((User? user) async {
        if (user != null) {
          await ref
              .read(appNavigatorProvider)
              .navigateTo(AppRoutes.mainMenu, shoulClearStack: true);
        } else {
          await ref
              .read(appNavigatorProvider)
              .navigateTo(AppRoutes.login, shoulClearStack: true);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage(AppImages.house),
        ),
      ),
    );
  }
}
