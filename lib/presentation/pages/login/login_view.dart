import 'package:batru_house_rental/data/providers/app_navigator_provider.dart';
import 'package:batru_house_rental/domain/use_case/auth/google_login_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/pages/add_data/add_type.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IntroSlider(
              hideStatusBar: true,
              showDoneBtn: false,
              showNextBtn: false,
              showPrevBtn: false,
              showSkipBtn: false,
              autoScroll: true,
              loopAutoScroll: true,
              autoScrollInterval: const Duration(seconds: 5),
              colorActiveDot: Colors.white,
              slides: [
                Slide(
                  title: 'Title 1',
                  description: 'Description 1',
                  backgroundColor: Colors.black,
                  heightImage: 370,
                  widthImage: 400,
                ),
                Slide(
                  title: 'Title 2',
                  description: 'Description 2',
                  backgroundColor: Colors.brown,
                  heightImage: 370,
                  widthImage: 400,
                ),
                Slide(
                  title: 'Title 3',
                  description: 'Description 3',
                  backgroundColor: Colors.green,
                  heightImage: 370,
                  widthImage: 400,
                ),
              ],
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
                  GestureDetector(
                    onTap: () {
                      ref
                          .read(appNavigatorProvider)
                          .navigateTo(AppRoutes.mainMenu);
                    },
                    child: Text(
                      'Skip',
                      style: AppTextStyles.headingSmall.copyWith(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddType(),
                        ),
                      );
                    },
                    child: Text(
                      'Admin',
                      style: AppTextStyles.headingSmall.copyWith(
                        color: Colors.blue,
                      ),
                    ),
                  ),
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
          await ref.read(appNavigatorProvider).navigateTo(AppRoutes.mainMenu);
        }
      },
    );
  }
}
