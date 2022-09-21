import 'package:batru_house_rental/data/providers/app_navigator_provider.dart';
import 'package:batru_house_rental/domain/use_case/auth/logout_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/pages/my_page/mypage_state.dart';
import 'package:batru_house_rental/presentation/pages/my_page/mypage_view_model.dart';
import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:batru_house_rental/presentation/widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _provider = StateNotifierProvider<MyPageViewModel, MyPageState>(
  (ref) => MyPageViewModel(
    injector.get<LogoutUseCase>(),
  ),
);

class MyPageView extends ConsumerStatefulWidget {
  const MyPageView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyPageViewState();
}

class _MyPageViewState extends ConsumerState<MyPageView>
    with AutomaticKeepAliveClientMixin {
  MyPageViewModel get _viewModel => ref.read(_provider.notifier);
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: const BaseAppBar.titleOnly(title: 'MyPage'),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppButton(
            isExpanded: true,
            title: 'Thoát tài khoản',
            onButtonTap: () {
              _viewModel.logout(() {
                ref.read(appNavigatorProvider).navigateTo(
                      AppRoutes.login,
                      shoulClearStack: true,
                    );
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
