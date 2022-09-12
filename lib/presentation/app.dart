import 'package:batru_house_rental/data/providers/app_navigator_provider.dart';
import 'package:batru_house_rental/presentation/navigation/app_router.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/resources/localizations/l10n.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: _MyApp(),
    );
  }
}

class _MyApp extends ConsumerStatefulWidget {
  const _MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<_MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<_MyApp> {
  @override
  Widget build(BuildContext context) {
    // final isDarkTheme = ref.watch(themeProvider);

    return MaterialApp(
      title: 'Project Name',
      theme: getAppTheme(Brightness.light),
      darkTheme: getAppTheme(Brightness.dark),
      // themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.home,
      navigatorKey: ref.read(appNavigatorProvider).navigatorKey,
      onGenerateRoute: AppRouter.onGenerateRoute,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.delegate.supportedLocales,
    );
  }
}
