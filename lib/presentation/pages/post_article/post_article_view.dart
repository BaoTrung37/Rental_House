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

  StepState setStepState(int step) {
    final currentStep = ref.watch(_provider).currentStep;
    if (step == currentStep) {
      return StepState.editing;
    } else if (step < currentStep) {
      return StepState.complete;
    } else {
      return StepState.indexed;
    }
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
            final isLastStep = ref.watch(_provider).currentStep == 3;
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
          steps: [
            Step(
              state: setStepState(0),
              title: const Text('Thông tin'),
              content: _buildInfomationInputView(),
            ),
            Step(
              state: setStepState(1),
              title: const Text('Bước 2'),
              content: const Text('Bước 2'),
            ),
            Step(
              state: setStepState(2),
              title: const Text('Bước 3'),
              content: const Text('Bước 3'),
            ),
            Step(
              state: setStepState(3),
              title: const Text('Bước 4'),
              content: const Text('Bước 4'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfomationInputView() {
    return Column(
      children: const [
        Text('Bước 1'),
      ],
    );
  }
}
