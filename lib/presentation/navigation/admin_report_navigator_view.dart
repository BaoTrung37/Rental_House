import 'package:batru_house_rental/data/providers/admin_report_provider.dart';
import 'package:batru_house_rental/presentation/navigation/app_router.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/widgets/app_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminReportNavigatorView extends ConsumerWidget {
  const AdminReportNavigatorView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppWillPopScope(
      navigator: ref.read(adminReportNavigatorProvider),
      child: Navigator(
        key: ref.read(adminReportNavigatorProvider).navigatorKey,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRoutes.adminReport,
      ),
    );
  }
}
