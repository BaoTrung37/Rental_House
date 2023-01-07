import 'package:batru_house_rental/domain/use_case/auth/logout_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/pages/admin_home/admin_post_state.dart';
import 'package:batru_house_rental/presentation/pages/admin_home/admin_post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _provider = StateNotifierProvider<AdminPostViewModel, AdminPostState>(
  (ref) => AdminPostViewModel(
    injector.get<LogoutUseCase>(),
  ),
);

class AdminPostView extends ConsumerStatefulWidget {
  const AdminPostView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends ConsumerState<AdminPostView> {
  AdminPostViewModel get _viewModel => ref.read(_provider.notifier);

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
