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
      body: Stepper(
        type: StepperType.horizontal,
        physics: const ClampingScrollPhysics(),
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
            title: const Text(''),
            label: const Text('Thông tin'),
            content: _buildInfomationInputView(),
          ),
          Step(
            state: setStepState(1),
            title: const Text(''),
            label: const Text('Địa chỉ'),
            content: _buildLocationInputView(),
          ),
          Step(
            state: setStepState(2),
            title: const Text(''),
            label: const Text('Tiện ích'),
            content: _buildConvenientInputView(),
          ),
          Step(
            state: setStepState(3),
            title: const Text(''),
            label: const Text('Xác nhận'),
            content: _buildConfirmInputView(),
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmInputView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Xác nhận',
          style: AppTextStyles.headingSmall,
        ),
        SizedBox(height: 8),
        InputTextField(
          labelText: 'Số điện thoại',
          placeholder: 'Nhập số điện thoại',
          keyboardType: TextInputType.phone,
        ),
        SizedBox(height: 8),
        InputTextField(
          labelText: 'Tiêu đề bài đăng',
          placeholder: 'Nhập tiêu đề bài đăng',
          keyboardType: TextInputType.text,
        ),
        SizedBox(height: 8),
        InputTextField(
          labelText: 'Nội dung mô tả',
          placeholder: 'Nhập nội dung mô tả',
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }

  Widget _buildConvenientInputView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Thông tin hình ảnh và tiện ích',
          style: AppTextStyles.headingSmall,
        ),
        const SizedBox(height: 8),
        const Text(
          'Hình ảnh',
          style: AppTextStyles.textMedium,
        ),
        const SizedBox(height: 8),
        Container(
          height: 200,
          color: Colors.black,
        ),
        const SizedBox(height: 8),
        Center(
          child: AppButton(
            leftIcon: AppIcons.image(
              color: context.colors.iconPrimary,
              size: 20,
            ),
            title: 'Chụp hình',
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Tiện ích',
          style: AppTextStyles.textMedium,
        ),
        const SizedBox(height: 8),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            mainAxisExtent: 50,
          ),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 16,
          addAutomaticKeepAlives: true,
          itemBuilder: (context, index) {
            return const ConvenientItem();
          },
        ),
      ],
    );
  }

  Widget _buildLocationInputView() {
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
          labelText: 'Tên đường',
          placeholder: 'Nhập tên đường',
        ),
        const SizedBox(height: 8),
        const InputTextField(
          labelText: 'Số nhà',
          placeholder: 'Nhập địa chỉ nhà',
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
    final isParkingSpaceAvailable =
        ref.watch(_provider).isParkingSpaceAvailable;
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
        const SizedBox(height: 8),
        const InputTextField(
          labelText: 'Diện tích (m2)',
          placeholder: 'Diện tích phòng',
          initialText: '10',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 8),
        const Text(
          'Chi phí',
          style: AppTextStyles.headingSmall,
        ),
        const SizedBox(height: 8),
        const InputTextField(
          labelText: 'Giá cho thuê (VNĐ/phòng)',
          placeholder: 'Diện tích phòng',
          initialText: '0',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 8),
        const InputTextField(
          labelText: 'Đặt cọc (VNĐ/phòng)',
          placeholder: 'Tiền cọc',
          initialText: '0',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 8),
        const InputTextField(
          labelText: 'Tiền điện (VNĐ/kWh)',
          placeholder: 'Tiền điện',
          initialText: '0',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 8),
        const InputTextField(
          labelText: 'Tiền nước (VNĐ/người)',
          placeholder: 'Tiền nước',
          initialText: '0',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 8),
        const InputTextField(
          labelText: 'Tiền Internet (VNĐ/phòng)',
          placeholder: 'Tiền nước',
          initialText: '0',
          keyboardType: TextInputType.number,
        ),
        // Checkbox(
        //   value: true,

        //   onChanged: (value) {},
        // ),
        CheckboxListTile(
          value: isParkingSpaceAvailable,
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text(
            'Có chỗ để xe',
            style: AppTextStyles.textMedium,
          ),
          contentPadding: const EdgeInsets.all(0),
          onChanged: (value) {
            ref.read(_provider.notifier).setIsParkingSpace(value!);
          },
        ),
        if (isParkingSpaceAvailable) ...[
          const SizedBox(height: 8),
          const InputTextField(
            labelText: 'Tiền gửi xe',
            placeholder: 'Tiền gửi xe',
            initialText: '0',
            keyboardType: TextInputType.number,
          ),
        ],
      ],
    );
  }
}

class ConvenientItem extends StatelessWidget {
  const ConvenientItem({
    this.isSelected = true,
    Key? key,
  }) : super(key: key);
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color:
              isSelected ? context.colors.primaryMain : context.colors.border,
          width: 1,
        ),
        color: isSelected
            ? context.colors.backgroundPrimary
            : context.colors.backgroundSecondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Image(
              image: const AssetImage(
                AppImages.tv,
              ),
              color: isSelected
                  ? context.colors.iconPrimary
                  : context.colors.iconSecondary,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Tivi',
            style: AppTextStyles.textMedium.copyWith(
              color: isSelected
                  ? context.colors.textPrimary
                  : context.colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
