import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(child: _Myapp());
  }
}

class _Myapp extends ConsumerStatefulWidget {
  const _Myapp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __MyappState();
}

class __MyappState extends ConsumerState<_Myapp> {
  @override
  Widget build(BuildContext context) {
    //  final isDarkTheme = ref.watch(themeProvider);

    return const MaterialApp(
      title: 'Project Name',

      // theme: getAppTheme(Brightness.light),
      // darkTheme: getAppTheme(Brightness.dark),
      // themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      // initialRoute: AppRoutes.splash,
      // navigatorKey: ref.read(appNavigatorProvider).navigatorKey,
      // onGenerateRoute: AppRouter.onGenerateRoute,
      // localizationsDelegates: const [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: AppLocalizations.delegate.supportedLocales,
    );
  }
}
