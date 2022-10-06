import 'package:batru_house_rental/domain/use_case/commune/get_commune_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/convenient/get_convenient_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/district/get_district_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/type/get_type_list_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/pages/post_article/post_article_state.dart';
import 'package:batru_house_rental/presentation/pages/post_article/post_article_view_model.dart';
import 'package:batru_house_rental/presentation/pages/post_article/widgets/convenient_item.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/utilities/common/validator.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:batru_house_rental/presentation/widgets/app_indicator/app_loading_indicator.dart';
import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:batru_house_rental/presentation/widgets/base_form/base_form_mixin.dart';
import 'package:batru_house_rental/presentation/widgets/buttons/app_button.dart';
import 'package:batru_house_rental/presentation/widgets/input_text_field/input_text_field.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _provider =
    StateNotifierProvider.autoDispose<PostArticleViewModel, PostArticleState>(
  (ref) => PostArticleViewModel(
    injector.get<GetTypeListUseCase>(),
    // injector.get<GetProvinceListUseCase>(),
    injector.get<GetDistrictListUseCase>(),
    injector.get<GetCommuneListUseCase>(),
    injector.get<GetConvenientListUseCase>(),
  ),
);

class PostArticleView extends ConsumerStatefulWidget {
  const PostArticleView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PostArticleViewState();
}

class _PostArticleViewState extends ConsumerState<PostArticleView>
    with BaseFormMixin {
  PostArticleViewModel get _viewModel => ref.read(_provider.notifier);
  PostArticleState get state => ref.watch(_provider);

  TextEditingController _houseAmountController = TextEditingController();
  TextEditingController _houseCapacityController = TextEditingController();
  TextEditingController _houseAreaController = TextEditingController();
  TextEditingController _housePriceController = TextEditingController();
  TextEditingController _houseDepositPriceController = TextEditingController();
  TextEditingController _houseElectricityPriceController =
      TextEditingController();
  TextEditingController _houseWaterPriceController = TextEditingController();
  TextEditingController _houseInternetPriceController = TextEditingController();
  TextEditingController _housePackingPriceController = TextEditingController();

  TextEditingController _streetNameController = TextEditingController();
  TextEditingController _apartmentNumberController = TextEditingController();

  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _articleTitleController = TextEditingController();
  TextEditingController _articleDesController = TextEditingController();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await _viewModel.initData();
    });
    super.initState();
  }

  @override
  void dispose() {
    _houseAmountController.dispose();
    _houseCapacityController.dispose();
    _houseAreaController.dispose();
    _housePriceController.dispose();
    _houseDepositPriceController.dispose();
    _houseElectricityPriceController.dispose();
    _houseWaterPriceController.dispose();
    _houseInternetPriceController.dispose();
    _housePackingPriceController.dispose();
    _streetNameController.dispose();
    _apartmentNumberController.dispose();
    _phoneNumberController.dispose();
    _articleTitleController.dispose();
    _articleDesController.dispose();

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
  Widget buildFormContent() {
    return Scaffold(
      appBar: const BaseAppBar.titleAndBackButton(
        title: 'Đăng phòng',
      ),
      body: state.status == LoadingStatus.inProgress
          ? const AppLoadingIndicator()
          : _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stepper(
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
    );
  }

  Widget _buildConfirmInputView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Xác nhận',
          style: AppTextStyles.headingSmall,
        ),
        const SizedBox(height: 8),
        InputTextField.singleLine(
          labelText: 'Số điện thoại',
          placeholder: 'Nhập số điện thoại',
          keyboardType: TextInputType.phone,
          controller: _phoneNumberController,
          textInputAction: TextInputAction.next,
          validator: Validator().required().phone().build(),
          onTextChange: (value) {
            _phoneNumberController.text = value!;
          },
        ),
        const SizedBox(height: 8),
        InputTextField.singleLine(
          labelText: 'Tiêu đề bài đăng',
          placeholder: 'Nhập tiêu đề bài đăng',
          keyboardType: TextInputType.text,
          controller: _articleTitleController,
          textInputAction: TextInputAction.next,
          validator: Validator().required().minLength(1).maxLength(50).build(),
          onTextChange: (value) {
            _articleTitleController.text = value!;
          },
        ),
        const SizedBox(height: 8),
        InputTextField.singleLine(
          labelText: 'Nội dung mô tả',
          placeholder: 'Nhập nội dung mô tả',
          keyboardType: TextInputType.text,
          controller: _articleDesController,
          textInputAction: TextInputAction.next,
          validator: Validator().required().minLength(1).maxLength(50).build(),
          onTextChange: (value) {
            _articleDesController.text = value!;
          },
        ),
      ],
    );
  }

  Widget _buildConvenientInputView() {
    _phoneNumberController = TextEditingController();
    _articleTitleController = TextEditingController();
    _articleDesController = TextEditingController();
    final state = ref.watch(_provider);
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
          itemCount: state.convenients.length,
          addAutomaticKeepAlives: true,
          itemBuilder: (context, index) {
            final convenient = state.convenients[index];
            return ConvenientItem(
              convenient: convenient,
              onTap: () {
                _viewModel.onConvenientTap(convenient.id);
                print('tap');
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildLocationInputView() {
    _streetNameController = TextEditingController();
    _apartmentNumberController = TextEditingController();
    final state = ref.watch(_provider);
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
          items: state.districts.map((e) => e.name).toList(),
          dropdownDecoratorProps: const DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: 'Quận/Huyện',
              hintText: 'Bấm để chọn quận/huyện',
            ),
          ),
          onChanged: (value) async {
            await _viewModel.onDistrictChanged(value!);
          },
        ),
        DropdownSearch<String>(
          popupProps: const PopupProps.menu(
            showSelectedItems: true,
          ),
          items: state.communes.map((e) => e.name).toList(),
          dropdownDecoratorProps: const DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: 'Phường/Xã',
              hintText: 'Bấm để chọn phường/xã',
            ),
          ),
          onChanged: (value) {
            _viewModel.onCommuneChanged(value!);
          },
        ),
        const SizedBox(height: 8),
        InputTextField.singleLine(
          labelText: 'Tên đường',
          placeholder: 'Nhập tên đường',
          keyboardType: TextInputType.text,
          controller: _streetNameController,
          textInputAction: TextInputAction.next,
          validator: Validator().required().minLength(1).maxLength(50).build(),
          onTextChange: (value) {
            _streetNameController.text = value!;
          },
        ),
        const SizedBox(height: 8),
        InputTextField.singleLine(
          labelText: 'Số nhà',
          placeholder: 'Nhập địa chỉ nhà',
          keyboardType: TextInputType.text,
          controller: _apartmentNumberController,
          textInputAction: TextInputAction.next,
          validator: Validator().required().minLength(1).maxLength(40).build(),
          onTextChange: (value) {
            _apartmentNumberController.text = value!;
          },
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
    _houseAmountController = TextEditingController();
    _houseCapacityController = TextEditingController();
    _houseAreaController = TextEditingController();
    _housePriceController = TextEditingController();
    _houseDepositPriceController = TextEditingController();
    _houseElectricityPriceController = TextEditingController();
    _houseWaterPriceController = TextEditingController();
    _houseInternetPriceController = TextEditingController();
    _housePackingPriceController = TextEditingController();
    //
    final state = ref.watch(_provider);
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
          items: state.types.map((element) => element.name).toList(),
          dropdownDecoratorProps: const DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: 'Loại phòng',
              hintText: 'Bấm để chọn loại phòng',
            ),
          ),
          onChanged: (value) {
            _viewModel.onTypeChanged(value!);
          },
        ),
        const SizedBox(height: 8),
        InputTextField.singleLine(
          labelText: 'Số lượng phòng (phòng)',
          placeholder: 'Số lượng phòng bạn đang quản lý',
          keyboardType: TextInputType.number,
          initialText: '1',
          controller: _houseAmountController,
          textInputAction: TextInputAction.next,
          validator: Validator().required().minLength(1).build(),
          onTextChange: (value) {
            _houseAmountController.text = value!;
          },
        ),
        const SizedBox(height: 8),
        InputTextField.singleLine(
          labelText: 'Sức chứa (người)',
          placeholder: 'Số lượng người tối đa có thể chứa',
          keyboardType: TextInputType.number,
          controller: _houseCapacityController,
          initialText: '1',
          textInputAction: TextInputAction.next,
          validator: Validator().required().minLength(1).build(),
          onTextChange: (value) {
            _houseCapacityController.text = value!;
          },
        ),
        const SizedBox(height: 8),
        InputTextField.singleLine(
          labelText: 'Diện tích (m2)',
          placeholder: 'Diện tích phòng',
          initialText: '10',
          keyboardType: TextInputType.number,
          controller: _houseAreaController,
          textInputAction: TextInputAction.next,
          validator: Validator().required().minLength(1).build(),
          onTextChange: (value) {
            _houseAreaController.text = value!;
          },
        ),
        const SizedBox(height: 8),
        const Text(
          'Chi phí',
          style: AppTextStyles.headingSmall,
        ),
        const SizedBox(height: 8),
        InputTextField.singleLine(
          labelText: 'Giá cho thuê (VNĐ/phòng)',
          placeholder: 'Diện tích phòng',
          initialText: '0',
          keyboardType: TextInputType.number,
          controller: _housePriceController,
          textInputAction: TextInputAction.next,
          validator: Validator().required().minLength(1).build(),
          onTextChange: (value) {
            _housePriceController.text = value!;
          },
        ),
        const SizedBox(height: 8),
        InputTextField.singleLine(
          labelText: 'Đặt cọc (VNĐ/phòng)',
          placeholder: 'Tiền cọc',
          initialText: '0',
          keyboardType: TextInputType.number,
          controller: _houseDepositPriceController,
          textInputAction: TextInputAction.next,
          onTextChange: (value) {
            _houseDepositPriceController.text = value!;
          },
        ),
        const SizedBox(height: 8),
        InputTextField.singleLine(
          labelText: 'Tiền điện (VNĐ/kWh)',
          placeholder: 'Tiền điện',
          initialText: '0',
          keyboardType: TextInputType.number,
          controller: _houseElectricityPriceController,
          textInputAction: TextInputAction.next,
          validator: Validator().required().minLength(4).build(),
          onTextChange: (value) {
            _houseElectricityPriceController.text = value!;
          },
        ),
        const SizedBox(height: 8),
        InputTextField.singleLine(
          labelText: 'Tiền nước (VNĐ/người)',
          placeholder: 'Tiền nước',
          initialText: '0',
          keyboardType: TextInputType.number,
          controller: _houseWaterPriceController,
          textInputAction: TextInputAction.next,
          validator: Validator().required().minLength(4).build(),
          onTextChange: (value) {
            _houseWaterPriceController.text = value!;
          },
        ),
        const SizedBox(height: 8),
        InputTextField.singleLine(
          labelText: 'Tiền Internet (VNĐ/phòng)',
          placeholder: 'Tiền nước',
          initialText: '0',
          keyboardType: TextInputType.number,
          controller: _houseInternetPriceController,
          textInputAction: TextInputAction.next,
          validator: Validator().required().minLength(4).build(),
          onTextChange: (value) {
            _houseInternetPriceController.text = value!;
          },
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
          InputTextField.singleLine(
            labelText: 'Tiền gửi xe',
            placeholder: 'Tiền gửi xe',
            initialText: '0',
            keyboardType: TextInputType.number,
            controller: _housePackingPriceController,
            textInputAction: TextInputAction.next,
            validator: Validator().required().minLength(4).build(),
            onTextChange: (value) {
              _housePackingPriceController.text = value!;
            },
          ),
        ],
      ],
    );
  }
}
