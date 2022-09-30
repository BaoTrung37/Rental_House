import 'package:batru_house_rental/presentation/pages/post_article/post_article_state.dart';
import 'package:batru_house_rental/presentation/pages/post_article/post_article_view_model.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:batru_house_rental/presentation/widgets/buttons/app_button.dart';
import 'package:batru_house_rental/presentation/widgets/input_text_field/input_text_field.dart';
import 'package:dropdown_search/dropdown_search.dart';
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
              title: const Text('Địa chỉ'),
              content: _buildLocationInputView(),
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

  Widget _buildLocationInputView() {
    final list = <String>['Hà Đông', 'Cầu Giấy', 'Hoàn Kiếm', 'Tây Hồ'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Địa chỉ',
          style: AppTextStyles.headingSmall,
        ),
        DropdownSearch<String>(
          popupProps: const PopupProps.menu(
            showSelectedItems: true,
          ),
          items: const ['Hà Đông', 'Cầu Giấy', 'Hoàn Kiếm', 'Tây Hồ'],
          dropdownDecoratorProps: const DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: 'Quận/Huyện',
              hintText: 'Bấm để chọn quận/huyện',
            ),
          ),
          onChanged: print,
          selectedItem: 'Hà Đông',
        ),
        DropdownSearch<String>(
          popupProps: const PopupProps.menu(
            showSelectedItems: true,
          ),
          items: const ['Phường DD', 'Phường DDd', 'Phường 23', 'Phường 2333'],
          dropdownDecoratorProps: const DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: 'Phường/Xã',
              hintText: 'Bấm để chọn phường/xã',
            ),
          ),
          onChanged: print,
          selectedItem: 'Phường DD',
        ),
        const SizedBox(height: 8),
        const InputTextField(
          labelText: 'Số nhà',
          placeholder: 'Địa chỉ nhà',
        ),
        // DropdownSearch<UserModel>(
        //   dropdownSearchDecoration: const InputDecoration(labelText: 'Name'),
        //   asyncItems: (String filter) async {
        //     final response = await Dio().get(
        //       'http://5d85ccfb1e61af001471bf60.mockapi.io/user',
        //       queryParameters: {'filter': filter},
        //     );
        //     final models = UserModel.fromJsonList(response.data);
        //     return models;
        //   },
        //   onChanged: (UserModel? data) {
        //     print(data);
        //   },
        // )
      ],
    );
  }

  Widget _buildInfomationInputView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Thông tin phòng',
          style: AppTextStyles.headingSmall,
        ),
        const SizedBox(height: 8),
        DropdownSearch<String>(
          popupProps: const PopupProps.menu(
            constraints: BoxConstraints(
              maxHeight: 220,
            ),
            showSelectedItems: true,
            fit: FlexFit.loose,
          ),
          items: const [
            'Phòng cho thuê',
            'Home stay',
            'Nhà nguyên căn',
            'Căn hộ',
          ],
          dropdownDecoratorProps: const DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: 'Loại phòng',
              hintText: 'Bấm để chọn loại phòng',
            ),
          ),
          onChanged: print,
          selectedItem: 'Phòng cho thuê',
        ),
        const SizedBox(height: 8),
        const InputTextField(
          labelText: 'Số lượng phòng (phòng)',
          placeholder: 'Số lượng phòng bạn đang quản lý',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 8),
        const InputTextField(
          labelText: 'Sức chứa (người)',
          placeholder: 'Số lượng người tối đa có thể chứa',
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
