import 'package:batru_house_rental/presentation/pages/post_article/post_article_state.dart';
import 'package:batru_house_rental/presentation/pages/post_article/post_article_view_model.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:batru_house_rental/presentation/widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _provider = StateNotifierProvider<PostArticleViewModel, PostArticleState>(
  (ref) => PostArticleViewModel(),
);

class PostArticleView extends ConsumerStatefulWidget {
  const PostArticleView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PostArticleViewState();
}

class _PostArticleViewState extends ConsumerState<PostArticleView> {
  PostArticleViewModel get _viewModel => ref.read(_provider.notifier);

  @override
  void initState() {
    _viewModel.initData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar.titleAndBackButton(
        title: 'Đăng phòng',
      ),
      body: Center(
        child: Stepper(
          type: StepperType.horizontal,
          currentStep: ref.watch(_provider).currentStep,
          onStepContinue: _viewModel.nextStep,
          onStepCancel: _viewModel.previousStep,
          onStepTapped: (step) => _viewModel.setStep(step),
          controlsBuilder: (context, details) {
            final isLastStep = ref.watch(_provider).currentStep == 2;
            final isFirstStep = ref.watch(_provider).currentStep == 0;
            return Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  Expanded(
                    child: AppButton(
                      title: isLastStep ? 'Đăng phòng' : 'Tiếp theo',
                      onButtonTap: details.onStepContinue,
                    ),
                  ),
                  if (!isFirstStep) ...[
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: AppButton(
                        title: 'Quay lại',
                        backgroundColor: context.colors.contentAlert,
                        onButtonTap: details.onStepCancel,
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
          steps: const [
            Step(
              state: StepState.complete,
              title: Text('Bước 1'),
              content: Text('Bước 1'),
              // label: Text('Bước 1'),
            ),
            Step(
              title: Text('Bước 2'),
              content: Text('Bước 2'),
            ),
            Step(
              title: Text('Bước 3'),
              content: Text('Bước 3'),
            ),
          ],
        ),
      ),
    );
  }
}
