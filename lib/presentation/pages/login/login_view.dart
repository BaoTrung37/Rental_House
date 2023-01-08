import 'package:batru_house_rental/data/providers/app_navigator_provider.dart';
import 'package:batru_house_rental/data/services/preference_services/shared_preferences_manager.dart';
import 'package:batru_house_rental/domain/use_case/article/get_initial_article_data_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/email_login_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/google_login_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/pages/login/login_state.dart';
import 'package:batru_house_rental/presentation/pages/login/login_view_model.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:batru_house_rental/presentation/utilities/enums/login_type.dart';
import 'package:batru_house_rental/presentation/widgets/buttons/app_button.dart';
import 'package:batru_house_rental/presentation/widgets/buttons/auth/authentication_button.dart';
import 'package:batru_house_rental/presentation/widgets/input_text_field/input_text_field.dart';
import 'package:batru_house_rental/presentation/widgets/snack_bar/error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intro_slider/intro_slider.dart';

final _provider = StateNotifierProvider.autoDispose<LoginViewModel, LoginState>(
  (ref) => LoginViewModel(
    injector.get<GoogleLoginUseCase>(),
    injector.get<GetInitialArticleDataUseCase>(),
    injector.get<EmailLoginUseCase>(),
    injector.get<SharedPreferencesManager>(),
  ),
);

class LoginView extends ConsumerStatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  LoginViewModel get _viewModel => ref.read(_provider.notifier);
  LoginState get _state => ref.watch(_provider);

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
    ref.listen<LoginState>(
      _provider,
      (previous, next) {
        if (next.status == LoadingStatus.error &&
            next.status != previous?.status) {
          showErrorSnackBar(
            context: context,
            errorMessage: next.appError,
          );
        }
      },
    );

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: _buildLoginView()),
          Positioned(
            top: 30,
            right: 20,
            child: _buildChangedTypeLoginButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildChangedTypeLoginButton() {
    return GestureDetector(
      onTap: () {
        _viewModel.changedLoginType();
      },
      child: const Icon(
        Icons.settings,
        size: 24,
        color: Colors.black,
      ),
    );
  }

  Widget _buildLoginView() {
    if (_state.loginType == LoginType.customer) {
      return _buildCustomerLoginView(context);
    } else {
      return _buildAdminLoginView(context);
    }
  }

  Widget _buildCustomerLoginView(BuildContext context) {
    return Column(
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
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAdminLoginView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Trang quản trị',
            style: AppTextStyles.headingSmall,
          ),
          const SizedBox(height: 20),
          InputTextField.singleLine(
            placeholder: 'Nhập tài khoản',
            labelText: 'Tài khoản',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            onTextChange: (value) {
              _viewModel.setAdminEmail(value!);
            },
          ),
          const SizedBox(height: 20),
          InputTextField.singleLine(
            placeholder: 'Nhập mật khẩu',
            labelText: 'Mật khẩu',
            isPassword: true,
            textInputAction: TextInputAction.next,
            onTextChange: (value) {
              _viewModel.setAdminPassword(value!);
            },
          ),
          const SizedBox(height: 20),
          AppButton(
            title: 'Đăng nhập',
            onButtonTap: () async {
              // login
              final isSuccess = await _viewModel.adminLoginSuccess();
              if (isSuccess) {
                await ref
                    .read(appNavigatorProvider)
                    .navigateTo(AppRoutes.adminMainMenu, shoulClearStack: true);
              }
            },
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
        final isSuccess = await _viewModel.customerLoginSuccess();
        if (isSuccess) {
          await ref
              .read(appNavigatorProvider)
              .navigateTo(AppRoutes.mainMenu, shoulClearStack: true);
        }
      },
    );
  }
}
