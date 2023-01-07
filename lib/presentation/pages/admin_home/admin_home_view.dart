import 'package:batru_house_rental/domain/use_case/auth/logout_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/pages/admin_home/admin_home_state.dart';
import 'package:batru_house_rental/presentation/pages/admin_home/admin_home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _provider = StateNotifierProvider<AdminHomeViewModel, AdminHomeState>(
  (ref) => AdminHomeViewModel(
    injector.get<LogoutUseCase>(),
  ),
);

class AdminHomeView extends ConsumerStatefulWidget {
  const AdminHomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends ConsumerState<AdminHomeView> {
  AdminHomeViewModel get _viewModel => ref.read(_provider.notifier);

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Admin Home View'),
      ),
    );
  }
}
