import 'package:batru_house_rental/data/providers/favorite_navigator_provider.dart';
import 'package:batru_house_rental/presentation/navigation/app_router.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/widgets/app_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteNavigatorView extends ConsumerWidget {
  const FavoriteNavigatorView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppWillPopScope(
      navigator: ref.read(favoriteNavigatorProvider),
      child: Navigator(
        key: ref.read(favoriteNavigatorProvider).navigatorKey,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRoutes.favorite,
      ),
    );
  }
}
