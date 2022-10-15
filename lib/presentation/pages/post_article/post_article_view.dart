import 'package:batru_house_rental/domain/use_case/address/post_address_use_case.dart';
import 'package:batru_house_rental/domain/use_case/article/post_article_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/get_current_user_information_use_case.dart';
import 'package:batru_house_rental/domain/use_case/commune/get_commune_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/convenient/get_convenient_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/convenient_house/post_convenient_house_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/district/get_district_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/house/post_house_use_case.dart';
import 'package:batru_house_rental/domain/use_case/image_house/post_image_house_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/image_house/post_image_to_storage_use_case.dart';
import 'package:batru_house_rental/domain/use_case/province/get_province_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/type/get_type_list_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/pages/post_article/post_article_state.dart';
import 'package:batru_house_rental/presentation/pages/post_article/post_article_view_model.dart';
import 'package:batru_house_rental/presentation/pages/post_article/widgets/convenient_item.dart';
import 'package:batru_house_rental/presentation/pages/post_article/widgets/input_image_view.dart';
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
    injector.get<GetProvinceListUseCase>(),
    injector.get<GetTypeListUseCase>(),
    injector.get<GetDistrictListUseCase>(),
    injector.get<GetCommuneListUseCase>(),
    injector.get<GetConvenientListUseCase>(),
    injector.get<PostHouseUseCase>(),
    injector.get<PostAddressUseCase>(),
    injector.get<PostConvenientHouseListUseCase>(),
    injector.get<PostImageHouseListUseCase>(),
    injector.get<PostImageToStorageUseCase>(),
    injector.get<PostArticleUseCase>(),
    injector.get<GetCurrentUserInformationUseCase>(),
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
  final _stepperKey = GlobalKey();
  PostArticleViewModel get _viewModel => ref.read(_provider.notifier);
  PostArticleState get state => ref.watch(_provider);

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await _viewModel.initData();
    });
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
  Widget buildFormContent() {
    return Scaffold(
      appBar: const BaseAppBar.titleAndBackButton(
        title: 'Đăng phòng',
      ),
      body: state.status == LoadingStatus.initial
          ? const AppLoadingIndicator()
          : _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stepper(
      key: _stepperKey,
      type: StepperType.horizontal,
      physics: const ClampingScrollPhysics(),
      currentStep: ref.watch(_provider).currentStep,
      onStepContinue: _viewModel.nextStep,
      onStepCancel: _viewModel.previousStep,
      onStepTapped: (step) => _viewModel.setStep(step),
      controlsBuilder: (context, details) {
        final isLastStep = ref.watch(_provider).currentStep == 3;
        final isFirstStep = ref.watch(_provider).currentStep == 0;
        return _buildButton(
            isLastStep, details, isFirstStep, context, state.status);
      },
      steps: [
        Step(
          state: setStepState(0),
          title: const Text(''),
          // label: const Text('Thông tin'),
          content: _buildInfomationInputView(),
        ),
        Step(
          state: setStepState(1),
          title: const Text(''),
          // label: const Text('Địa chỉ'),
          content: _buildLocationInputView(),
        ),
        Step(
          state: setStepState(2),
          title: const Text(''),
          // label: const Text('Tiện ích'),
          content: _buildConvenientInputView(),
        ),
        Step(
          state: setStepState(3),
          title: const Text(''),
          // label: const Text('Xác nhận'),
          content: _buildConfirmInputView(),
        ),
      ],
    );
  }

  Container _buildButton(bool isLastStep, ControlsDetails details,
      bool isFirstStep, BuildContext context, LoadingStatus status) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Expanded(
            child: AppButton(
              isExpanded: true,
              buttonState: status.buttonState,
              title: isLastStep ? 'Đăng phòng' : 'Tiếp theo',
              onButtonTap: !isLastStep
                  ? details.onStepContinue
                  : () {
                      validate(
                        onSuccess: () {
                          _viewModel.postArticle();
                        },
                      );
                    },
            ),
          ),
          if (!isFirstStep) ...[
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: AppButton(
                isExpanded: true,
                title: 'Quay lại',
                backgroundColor: context.colors.contentAlert,
                onButtonTap: details.onStepCancel,
              ),
            ),
          ],
        ],
      ),
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
          textInputAction: TextInputAction.next,
          validator: Validator().required().phone().build(),
          onTextChange: (value) {
            _viewModel.setPhoneNumber(value!);
          },
        ),
        const SizedBox(height: 8),
        InputTextField.singleLine(
          labelText: 'Tiêu đề bài đăng',
          placeholder: 'Nhập tiêu đề bài đăng',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          validator: Validator().required().minLength(1).maxLength(50).build(),
          onTextChange: (value) {
            _viewModel.setTitle(value!);
          },
        ),
        const SizedBox(height: 8),
        InputTextField.singleLine(
          labelText: 'Nội dung mô tả',
          placeholder: 'Nhập nội dung mô tả',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          validator: Validator().required().minLength(1).maxLength(50).build(),
          onTextChange: (value) {
            _viewModel.setDescription(value!);
          },
        ),
      ],
    );
  }

  Widget _buildConvenientInputView() {
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
          decoration: BoxDecoration(
            color: context.colors.secondaryBackgroundPrimary,
            border: Border.all(
              color: context.colors.border,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: InputImageView(
            screenshotList: state.screenshotList,
            onDeleteTap: _viewModel.removeImage,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: AppButton(
            leftIcon: AppIcons.image(
              color: context.colors.iconPrimary,
              size: 20,
            ),
            title: 'Chụp hình',
            onButtonTap: () {
              _viewModel.openImagePicker(context);
            },
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
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildLocationInputView() {
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
          initialText: state.house?.streetName,
          textInputAction: TextInputAction.next,
          validator: Validator().required().minLength(1).maxLength(50).build(),
          onTextChange: (value) {
            _viewModel.setStreetName(value!);
          },
        ),
        const SizedBox(height: 8),
        InputTextField.singleLine(
          labelText: 'Số nhà',
          placeholder: 'Nhập địa chỉ nhà',
          keyboardType: TextInputType.text,
          initialText: state.house?.houseNumber,
          textInputAction: TextInputAction.next,
          validator: Validator().required().minLength(1).maxLength(40).build(),
          onTextChange: (value) {
            _viewModel.setHouseNumber(value!);
          },
        ),
      ],
    );
  }

  Widget _buildInfomationInputView() {
    final houseState = ref.watch(_provider).house;
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
        // const SizedBox(height: 8),
        // InputTextField.singleLine(
        //   labelText: 'Số lượng phòng (phòng)',
        //   placeholder: 'Số lượng phòng bạn đang quản lý',
        //   keyboardType: TextInputType.number,
        //   initialText: '1',
        //   textInputAction: TextInputAction.next,
        //   validator: Validator().required().minLength(1).build(),
        //   onTextChange: (value) {},
        // ),
        const SizedBox(height: 8),
        InputTextField.singleLine(
          labelText: 'Sức chứa (người)',
          placeholder: 'Số lượng người tối đa có thể chứa',
          keyboardType: TextInputType.number,
          initialText: houseState?.capacity.toString(),
          textInputAction: TextInputAction.next,
          validator: Validator().required().build(),
          onTextChange: (value) {
            _viewModel.setHouseCapacity(value!);
          },
        ),
        const SizedBox(height: 8),
        InputTextField.singleLine(
          labelText: 'Diện tích (m2)',
          placeholder: 'Diện tích phòng',
          initialText: houseState?.area.toString(),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: Validator().required().build(),
          onTextChange: (value) {
            _viewModel.setHouseArea(value!);
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
          initialText: state.house?.rentalPrice.toString(),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: Validator().required().build(),
          onTextChange: (value) {
            _viewModel.setRentalPrice(value!);
          },
        ),
        const SizedBox(height: 8),
        InputTextField.singleLine(
          labelText: 'Đặt cọc (VNĐ/phòng)',
          placeholder: 'Tiền cọc',
          initialText: state.house?.depositPrice.toString(),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          onTextChange: (value) {
            _viewModel.setDipositPrice(value!);
          },
        ),
        const SizedBox(height: 8),
        InputTextField.singleLine(
          labelText: 'Tiền điện (VNĐ/kWh)',
          placeholder: 'Tiền điện',
          initialText: state.house?.electricPrice.toString(),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: Validator().required().build(),
          onTextChange: (value) {
            _viewModel.setElectricPrice(value!);
          },
        ),
        const SizedBox(height: 8),
        InputTextField.singleLine(
          labelText: 'Tiền nước (VNĐ/người)',
          placeholder: 'Tiền nước',
          initialText: state.house?.waterPrice.toString(),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: Validator().required().build(),
          onTextChange: (value) {
            _viewModel.setWaterPrice(value!);
          },
        ),
        const SizedBox(height: 8),
        InputTextField.singleLine(
          labelText: 'Tiền Internet (VNĐ/phòng)',
          placeholder: 'Tiền nước',
          initialText: state.house?.internetPrice.toString(),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: Validator().required().build(),
          onTextChange: (value) {
            _viewModel.setInternetPrice(value!);
          },
        ),
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
            initialText: state.house?.parkingPrice.toString(),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            validator: Validator().required().build(),
            onTextChange: (value) {
              _viewModel.setParkingPrice(value!);
            },
          ),
        ],
      ],
    );
  }
}
