import 'package:batru_house_rental/data/providers/mypage_navigator_provider.dart';
import 'package:batru_house_rental/presentation/navigation/app_router.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/widgets/app_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPageNavigatorView extends ConsumerWidget {
  const MyPageNavigatorView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppWillPopScope(
      navigator: ref.read(myPageNavigatorProvider),
      child: Navigator(
        key: ref.read(myPageNavigatorProvider).navigatorKey,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRoutes.myPage,
      ),
    );
  }
}
