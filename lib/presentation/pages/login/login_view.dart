import 'package:batru_house_rental/data/providers/app_navigator_provider.dart';
import 'package:batru_house_rental/domain/use_case/article/get_initial_article_data_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/google_login_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/pages/login/login_state.dart';
import 'package:batru_house_rental/presentation/pages/login/login_view_model.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/widgets/buttons/auth/authentication_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intro_slider/intro_slider.dart';

final _provider = StateNotifierProvider.autoDispose<LoginViewModel, LoginState>(
  (ref) => LoginViewModel(
    injector.get<GoogleLoginUseCase>(),
    injector.get<GetInitialArticleDataUseCase>(),
  ),
);

class LoginView extends ConsumerStatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  LoginViewModel get _viewModel => ref.read(_provider.notifier);

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
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IntroSlider(
              listContentConfig: const [
                ContentConfig(
                  backgroundNetworkImage:
                      'https://noithatminhkhang.vn/upload/news/phong-ngu-001-500x340-2926.jpg',
                  title: 'Cách tìm nhà đơn giản',
                ),
                ContentConfig(
                  backgroundNetworkImage:
                      'https://amia.vn/wp-content/uploads/2021/02/tranh-hoa-trang-tri-phong-ngu-dep-hien-dai-1633.jpg',
                  title: 'Đáp ứng mọi ngân sách',
                  // backgroundColor: Colors.red,
                ),
              ],
              // listCustomTabs: [
              //   Container(
              //     width: 100,
              //     height: 100,
              //     color: Colors.amber,
              //   )
              // ],
              isShowDoneBtn: false,
              isShowNextBtn: false,
              isShowPrevBtn: false,
              isShowSkipBtn: false,
              // backgroundColorAllTabs: Colors.red,
              isAutoScroll: true,
              isLoopAutoScroll: true,
              autoScrollInterval: const Duration(seconds: 5),
            ),
          ),
          SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildLoginTitle(),
                  const SizedBox(height: 20),
                  _buildGoogleLoginButton(context),
                  const SizedBox(height: 20),
                  // GestureDetector(
                  //   onTap: () {
                  //     ref
                  //         .read(appNavigatorProvider)
                  //         .navigateTo(AppRoutes.mainMenu);
                  //   },
                  //   child: Text(
                  //     'Skip',
                  //     style: AppTextStyles.headingSmall.copyWith(
                  //       color: Colors.blue,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginTitle() {
    return const Text(
      'Đăng nhập bằng',
      style: AppTextStyles.headingSmall,
    );
  }

  Widget _buildGoogleLoginButton(BuildContext context) {
    return AuthenticationButton(
      title: 'Google',
      icon: const Image(
        image: AssetImage(AppImages.google),
        width: 19,
      ),
      color: context.colors.googleButton,
      onButtonTap: () async {
        final isSuccess = await _viewModel.loginSuccess();
        if (isSuccess) {
          await ref
              .read(appNavigatorProvider)
              .navigateTo(AppRoutes.mainMenu, shoulClearStack: true);
        }
      },
    );
  }
}
