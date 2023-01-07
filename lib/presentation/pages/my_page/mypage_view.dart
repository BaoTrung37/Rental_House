import 'package:batru_house_rental/data/providers/app_navigator_provider.dart';
import 'package:batru_house_rental/domain/use_case/auth/get_current_user_information_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/logout_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/pages/my_page/mypage_state.dart';
import 'package:batru_house_rental/presentation/pages/my_page/mypage_view_model.dart';
import 'package:batru_house_rental/presentation/pages/owner_article/owner_article_view.dart';
import 'package:batru_house_rental/presentation/resources/app_text_styles.dart';
import 'package:batru_house_rental/presentation/widgets/app_divider/app_divider.dart';
import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _provider =
    StateNotifierProvider.autoDispose<MyPageViewModel, MyPageState>(
  (ref) => MyPageViewModel(
    injector.get<LogoutUseCase>(),
    injector.get<GetCurrentUserInformationUseCase>(),
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
  MyPageState get _state => ref.watch(_provider);

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () async {
      await _viewModel.initData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: const BaseAppBar.titleOnly(title: 'Tài khoản'),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  _state.user?.name ?? '',
                  style: AppTextStyles.headingMedium,
                ),
              ),
              CircleAvatar(
                minRadius: 25,
                backgroundImage: NetworkImage(
                    _state.user?.avatar ?? 'https://picsum.photos/200'),
              ),
            ],
          ),
        ),
        const AppDivider(),
        ListTile(
          onTap: () {},
          horizontalTitleGap: 1,
          title: const Text(
            'Thông tin cá nhân',
            style: AppTextStyles.textLarge,
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        ),
        const AppDivider(),
        ListTile(
          onTap: () async {
            final userId = await _viewModel.getCurrentUserId();

            await ref.read(appNavigatorProvider).navigateTo(
                AppRoutes.ownerHouse,
                arguments: OnwerArticleArguments(userId: userId));
          },
          horizontalTitleGap: 1,
          title: const Text(
            'Bài đăng của tôi',
            style: AppTextStyles.textLarge,
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        ),
        const AppDivider(),
        ListTile(
          onTap: () {},
          horizontalTitleGap: 1,
          title: const Text(
            'Điều khoản và chính sách',
            style: AppTextStyles.textLarge,
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        ),
        const AppDivider(),
        ListTile(
          onTap: () {
            _viewModel.logout(() {
              ref.read(appNavigatorProvider).navigateTo(
                    AppRoutes.login,
                    shoulClearStack: true,
                  );
            });
          },
          horizontalTitleGap: 1,
          title: const Text(
            'Thoát tài khoản',
            style: AppTextStyles.textLarge,
          ),
          trailing: const Icon(Icons.logout_sharp, size: 20),
        ),
        const AppDivider(),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
