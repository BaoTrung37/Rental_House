import 'dart:ui';

import 'package:batru_house_rental/data/providers/app_navigator_provider.dart';
import 'package:batru_house_rental/domain/entities/image_house/image_house_entity.dart';
import 'package:batru_house_rental/domain/use_case/article/get_article_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/article/get_article_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/get_current_user_information_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/get_user_by_id_use_case.dart';
import 'package:batru_house_rental/domain/use_case/chat/post_chat_room_use_case.dart';
import 'package:batru_house_rental/domain/use_case/favorite/add_favorite_use_case.dart';
import 'package:batru_house_rental/domain/use_case/favorite/check_favorite_use_case.dart';
import 'package:batru_house_rental/domain/use_case/favorite/remove_favorite_use_case.dart';
import 'package:batru_house_rental/domain/use_case/house/post_available_house_use_case.dart';
import 'package:batru_house_rental/domain/use_case/house/remove_house_use_case.dart';
import 'package:batru_house_rental/domain/use_case/house/un_post_available_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/pages/house_detail/house_detail_state.dart';
import 'package:batru_house_rental/presentation/pages/house_detail/house_detail_view_model.dart';
import 'package:batru_house_rental/presentation/pages/house_detail/widgets/convenient_item.dart';
import 'package:batru_house_rental/presentation/pages/house_detail/widgets/convenient_list_item.dart';
import 'package:batru_house_rental/presentation/pages/house_detail/widgets/relative_house_item_view.dart';
import 'package:batru_house_rental/presentation/pages/owner_article/owner_article_view.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:batru_house_rental/presentation/utilities/helper/date_format_helper.dart';
import 'package:batru_house_rental/presentation/utilities/helper/number_format_helper.dart';
import 'package:batru_house_rental/presentation/widgets/app_dialog/show_app_dialog.dart';
import 'package:batru_house_rental/presentation/widgets/app_divider/app_divider.dart';
import 'package:batru_house_rental/presentation/widgets/app_indicator/loading_view.dart';
import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:batru_house_rental/presentation/widgets/buttons/app_button.dart';
import 'package:batru_house_rental/presentation/widgets/image/image_with_border.dart';
import 'package:batru_house_rental/presentation/widgets/input_text_field/input_text_field.dart';
import 'package:batru_house_rental/presentation/widgets/snack_bar/error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _familyProvider = StateNotifierProvider.autoDispose
    .family<HouseDetailViewModel, HouseDetailState, String>(
  (ref, argument) => HouseDetailViewModel(
    injector.get<GetArticleUseCase>(),
    injector.get<GetUserByIdUseCase>(),
    injector.get<GetCurrentUserInformationUseCase>(),
    injector.get<GetArticleListUseCase>(),
    injector.get<PostChatRoomUseCase>(),
    injector.get<RemoveHouseUseCase>(),
    injector.get<CheckFavoriteUseCase>(),
    injector.get<AddFavoriteUseCase>(),
    injector.get<RemoveFavoriteUseCase>(),
    injector.get<PostAvailableHouseUseCase>(),
    injector.get<UnPostAvailableHouseUseCase>(),
  ),
);

class HouseDetailArguments {
  HouseDetailArguments({
    required this.houseId,
  });
  final String houseId;
}

class HouseDetailView extends ConsumerStatefulWidget {
  const HouseDetailView({
    required this.houseId,
    Key? key,
  }) : super(key: key);

  final String houseId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HouseDetailViewState();
}

class _HouseDetailViewState extends ConsumerState<HouseDetailView> {
  HouseDetailViewModel get _viewModel => ref.read(_provider.notifier);

  late final _provider = _familyProvider(widget.houseId);

  HouseDetailState get state => ref.watch(_provider);

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () {
      _viewModel.init(widget.houseId);
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<HouseDetailState>(
      _provider,
      (previous, next) {
        if (next.status == LoadingStatus.error &&
            next.status != previous?.status) {
          showErrorSnackBar(
            context: context,
            errorMessage: next.appError,
          );
        }

        if (next.removeHouseStatus == LoadingStatus.success) {
          ref
              .read(appNavigatorProvider)
              .popUntil(routeName: AppRoutes.mainMenu);
        }
      },
    );

    return Scaffold(
      appBar: BaseAppBar.titleAndBackButton(
        title: 'Chi tiết phòng',
        shouldShowBottomDivider: true,
        widgets: [
          _buildFavoriteIcon(context),
        ],
      ),
      body: LoadingView(
        status: state.status,
        child: _buildBodyContent(context),
      ),
    );
  }

  Widget _buildFavoriteIcon(BuildContext context) {
    return GestureDetector(
      onTap: _viewModel.onFavoriteChanged,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Icon(
          state.isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
          color: state.isFavorite
              ? context.colors.contentSpecialMain
              : context.colors.border,
        ),
      ),
    );
  }

  Widget _buildBodyContent(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _buildBodyView(context),
        ),
        if (state.isYourHouse == true)
          _buildOwnerBottomApp(context)
        else
          _buildCustomerBottomApp(context),
      ],
    );
  }

  Widget _buildOwnerBottomApp(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildUpdateHouseButton(context),
            _buildAvaliblePostButton(context),
            _buildRemoveHouseButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildRemoveHouseButton(BuildContext context) {
    return AppButton(
      onButtonTap: () {
        showAppDialog(
          context,
          title: 'Xóa phòng',
          content: 'Bạn có muốn xóa phòng này không?',
          actions: [
            ActionAppDialog(
              actionDialogTitle: 'Đồng ý',
              onAction: (_) async {
                Navigator.of(context).pop();
                await _viewModel.onRemoveHouse();
              },
            ),
            ActionAppDialog(
              actionDialogTitle: 'Bỏ đi',
              onAction: (_) {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
      leftIcon: const Icon(
        Icons.remove_circle_outline_sharp,
        size: 16,
        color: Colors.white,
      ),
      title: 'Xoá',
      backgroundColor: context.colors.error,
    );
  }

  Widget _buildAvaliblePostButton(BuildContext context) {
    final isAvalible = state.article?.house?.isAvailablePost ?? false;
    return AppButton(
      onButtonTap: () async {
        await _viewModel.onAvailablePostChanged();
      },
      leftIcon: const Icon(
        Icons.autorenew_sharp,
        size: 16,
        color: Colors.white,
      ),
      title: isAvalible ? 'Còn phòng' : 'Hết phòng',
      backgroundColor: isAvalible
          ? context.colors.primaryMain
          : context.colors.iconSecondary,
    );
  }

  Widget _buildUpdateHouseButton(BuildContext context) {
    return AppButton(
      onButtonTap: () {},
      leftIcon: const Icon(
        Icons.settings,
        size: 16,
        color: Colors.white,
      ),
      title: 'Sửa',
      backgroundColor: context.colors.contentEntry,
    );
  }

  Widget _buildCustomerBottomApp(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildChatButton(context),
            _buildDespoistButton(context),
            _buildPhoneCallButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneCallButton(BuildContext context) {
    return AppButton(
      onButtonTap: () {},
      leftIcon: const Icon(
        Icons.phone,
        size: 16,
        color: Colors.white,
      ),
      title: 'Gọi',
      backgroundColor: context.colors.contentEntry,
    );
  }

  Widget _buildDespoistButton(BuildContext context) {
    return AppButton(
      onButtonTap: () {},
      leftIcon: const Icon(
        Icons.money_off_csred_outlined,
        color: Colors.white,
        size: 16,
      ),
      title: 'Đặt chỗ',
      backgroundColor: context.colors.contentAlert,
    );
  }

  Widget _buildChatButton(BuildContext context) {
    return AppButton(
      onButtonTap: () {
        showAppDialog(
          context,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Chat với chủ nhà'),
              const SizedBox(height: 8),
              const AppDivider(),
              const SizedBox(height: 8),
              const Text(
                  'Bạn vui lòng đọc kĩ mô tả trước khi hỏi nhé!\nBạn muốn hỏi gì nè?'),
              const SizedBox(height: 8),
              InputTextField(
                placeholder: 'Nhập nội dung!',
                initialText: state.message,
                onTextChange: (value) {
                  debugPrint(value!);
                  _viewModel.onMessageChanged(value);
                },
              ),
            ],
          ),
          actions: [
            ActionAppDialog(
              actionDialogTitle: 'Huỷ',
              onAction: (_) {
                Navigator.of(context).pop();
              },
            ),
            ActionAppDialog(
              actionDialogTitle: 'Gửi',
              onAction: (_) async {
                Navigator.of(context).pop();
                await _viewModel.onSendMessage();
              },
            ),
          ],
        );
      },
      leftIcon: const Icon(
        Icons.chat_bubble_outline_sharp,
        size: 16,
        color: Colors.white,
      ),
      title: 'Chat',
    );
  }

  Widget _buildBodyView(BuildContext context) {
    final imageList = state.article?.imageList ?? [];
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.30,
            child: Row(
              children: [
                Expanded(
                  child: _buildImageList(context, imageList),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildSubTitle(context),
                const SizedBox(height: 10),
                _buildTitle(context),
                const SizedBox(height: 10),
                _buildRoomPrice(context),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildRoomStatusInfo(context),
                    _buildRoomAreaInfo(context),
                    _buildRoomDepositInfo(context),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: AppDivider(height: 1),
                ),
                _buildConvenientNeed(),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: _buildBigDivider(),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildNoteTitle(),
                const SizedBox(height: 10),
                const Text(
                  'Sức chứa',
                  style: AppTextStyles.labelMediumLight,
                ),
                const SizedBox(height: 10),
                _buildCapacityView(),
                // Add luu y
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: _buildBigDivider(),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildDetailTitle(),
                const SizedBox(height: 10),
                _buildDetailText(context),
                // const Padding(
                //   padding: EdgeInsets.symmetric(vertical: 16),
                //   child: AppDivider(height: 1),
                // ),
                // _buildSeeMoreOrCollapseButton(context),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: _buildBigDivider(),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildLocationTitle(),
                const SizedBox(height: 10),
                _buildSpecificAddressView(context),
                const SizedBox(height: 10),
                _buildSpecificPhoneNumberView(context),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: _buildBigDivider(),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildPostDateTitle(),
                const SizedBox(height: 10),
                _buildPostDateView(context),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: _buildBigDivider(),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildConvenientTitle(),
              ],
            ),
          ),
        ),
        _buildConvenientItemList(),
        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        SliverToBoxAdapter(
          child: _buildBigDivider(),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    state.onwerHouse?.avatar ?? 'https://picsum.photos/200',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.onwerHouse?.name ?? '',
                        style: AppTextStyles.textMedium,
                      ),
                      Text(
                        '1 phòng',
                        style: AppTextStyles.labelSmall.copyWith(
                          color: context.colors.primaryText,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 16,
                  ),
                  onPressed: () async {
                    final userId = await _viewModel.getOwnerHouseUserId();
                    await ref.read(appNavigatorProvider).navigateTo(
                        AppRoutes.ownerHouse,
                        arguments: OnwerArticleArguments(userId: userId));
                  },
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: _buildBigDivider(),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcons.flag(
                  size: 20,
                  color: context.colors.contentSpecialMain,
                ),
                const SizedBox(width: 10),
                Text(
                  'Báo cáo tin đăng',
                  style: AppTextStyles.headingXSmall
                      .copyWith(color: context.colors.contentSpecialText),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: _buildBigDivider(),
        ),
        _buildHouseArticleRelativeList(),
      ],
    );
  }

  Widget _buildCapacityView() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${state.smallQuantity} người +',
                style: AppTextStyles.labelSmallLight.copyWith(
                  color: Colors.orange[400],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.orange[400],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Chật',
                style: AppTextStyles.labelSmallLight,
              ),
            ],
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${state.normalQuantity} người',
                style: AppTextStyles.labelSmallLight.copyWith(
                  color: Colors.green[400],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Ổn',
                style: AppTextStyles.labelSmallLight,
              ),
            ],
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${state.largeQuantity} người',
                style: AppTextStyles.labelSmallLight.copyWith(
                  color: Colors.blue[300],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Rộng',
                style: AppTextStyles.labelSmallLight,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImageList(
      BuildContext context, List<ImageHouseEntity> imageList) {
    return ListView.builder(
      itemExtent: MediaQuery.of(context).size.width,
      scrollDirection: Axis.horizontal,
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        return _buildImage(imageList[index].url);
      },
    );
  }

  // TODO: Show image
  Widget _buildImage(String url) {
    return GestureDetector(
      onTap: () {},
      child: ImageWithBorder(
        url: url,
      ),
    );
  }

  Widget _buildConvenientNeed() {
    final internetPrice = state.article?.house?.internetPrice;
    final electricPrice = state.article?.house?.electricPrice;
    final waterPrice = state.article?.house?.waterPrice;
    final isAvailableParking =
        state.article?.house?.isAvailableParking ?? false;
    final parkingPrice = state.article?.house?.parkingPrice;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (electricPrice != null && electricPrice > 0)
          ConvenientItem(
            type: ConvenientType.electricity,
            price: electricPrice,
          ),
        if (waterPrice != null && waterPrice > 0)
          ConvenientItem(
            type: ConvenientType.water,
            price: waterPrice,
          ),
        if (internetPrice != null && internetPrice > 0)
          ConvenientItem(
            type: ConvenientType.wifi,
            price: internetPrice,
          ),
        if (isAvailableParking)
          ConvenientItem(
            type: ConvenientType.parking,
            price: parkingPrice ?? 0,
          ),
      ],
    );
  }

  SliverPadding _buildHouseArticleRelativeList() {
    final houseArticleList = state.houseArticleRelativeList;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            const Text(
              'Bài đăng liên quan',
              style: AppTextStyles.headingXSmall,
            ),
            const SizedBox(height: 10),
            GridView.builder(
              itemCount: houseArticleList.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 220,
                childAspectRatio: 0.80,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => RelativeHouseItemView(
                articleEntity: houseArticleList[index],
                onTap: () {
                  ref.read(appNavigatorProvider).navigateTo(
                        AppRoutes.houseDetail,
                        arguments: HouseDetailArguments(
                          houseId: houseArticleList[index].id,
                        ),
                      );
                },
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }

  SliverGrid _buildConvenientItemList() {
    final convenientList = ref.watch(_provider).article?.convenientList ?? [];
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => ConvenientListItem(
          convenientEntity: convenientList[index],
        ),
        childCount: convenientList.length,
      ),
    );
  }

  Widget _buildPostDateView(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.date_range_rounded,
          size: 20,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            state.article?.house?.createdAt.getPublishDatePastFormatString ??
                '',
            style: AppTextStyles.textMedium.copyWith(
              color: context.colors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Text _buildPostDateTitle() {
    return const Text('Ngày đăng', style: AppTextStyles.headingXSmall);
  }

  Text _buildConvenientTitle() =>
      const Text('Tiện ích', style: AppTextStyles.headingXSmall);

  Row _buildSpecificPhoneNumberView(BuildContext context) {
    final phoneNumber = ref.watch(_provider).article?.house?.phoneNumber;
    return Row(
      children: [
        const Icon(
          Icons.phone_enabled,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            'Số điện thoại: $phoneNumber',
            style: AppTextStyles.textMedium.copyWith(
              color: context.colors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Row _buildSpecificAddressView(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_on_outlined,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            state.article?.house?.address ?? '',
            style: AppTextStyles.textMedium.copyWith(
              color: context.colors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Text _buildLocationTitle() =>
      const Text('Địa chỉ', style: AppTextStyles.headingXSmall);

  // Center _buildSeeMoreOrCollapseButton(BuildContext context) {
  //   return Center(
  //     child: Text(
  //       'Xem thêm',
  //       style: AppTextStyles.textMediumBold.copyWith(
  //         color: context.colors.primaryText,
  //       ),
  //     ),
  //   );
  // }

  Widget _buildDetailText(BuildContext context) {
    final article = ref.watch(_provider).article;
    return Text(
      article?.house?.description ?? '',
      overflow: TextOverflow.ellipsis,
      style: AppTextStyles.textMedium.copyWith(
        color: context.colors.textPrimary,
      ),
    );
  }

  Text _buildDetailTitle() =>
      const Text('Chi tiết', style: AppTextStyles.headingXSmall);

  Text _buildNoteTitle() =>
      const Text('Lưu ý', style: AppTextStyles.headingXSmall);

  Widget _buildBigDivider() {
    return const AppDivider(height: 1, thickness: 5);
  }

  Center _buildRoomPrice(BuildContext context) {
    return Center(
      child: Text(
        'Giá phòng: ${NumberFormatHelper.formatShortPrice(state.article?.house?.rentalPrice ?? 0)}/phòng',
        style: AppTextStyles.textLarge.copyWith(
          color: context.colors.contentSpecialMain,
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      state.article?.house?.title ?? '',
      style: AppTextStyles.headingSmall.copyWith(
        color: context.colors.textPrimary,
      ),
    );
  }

  Text _buildSubTitle(BuildContext context) {
    return Text(
      'TÌM NGƯỜI THUÊ. ${state.article?.house?.capacity}',
      style: AppTextStyles.labelSmallLight.copyWith(
        color: context.colors.textSecondary,
      ),
    );
  }

  Widget _buildRoomStatusInfo(BuildContext context) {
    final isAvalible = state.article?.house?.isAvailablePost ?? false;
    return Column(
      children: [
        Text(
          'CÒN PHÒNG',
          style: AppTextStyles.labelSmallLight.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        Text(
          isAvalible ? 'Còn' : 'Hết',
          style: AppTextStyles.labelSmallLight.copyWith(
            color: context.colors.contentSpecialText,
          ),
        ),
      ],
    );
  }

  Widget _buildRoomAreaInfo(BuildContext context) {
    return Column(
      children: [
        Text(
          'DIỆN TÍCH',
          style: AppTextStyles.labelSmallLight.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        DefaultTextStyle(
          style: AppTextStyles.labelSmallLight,
          child: Wrap(
            children: [
              Text(
                '${state.article?.house?.area}m',
                style: TextStyle(
                  color: context.colors.contentSpecialText,
                ),
              ),
              Text(
                '2',
                style: TextStyle(
                  color: context.colors.contentSpecialText,
                  fontFeatures: const [
                    FontFeature.enable('sups'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRoomDepositInfo(BuildContext context) {
    return Column(
      children: [
        Text(
          'ĐẶT CỌC',
          style: AppTextStyles.labelSmallLight.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        Text(
          state.article?.house?.depositMonth == 0
              ? 'Không'
              : '${state.article?.house?.depositMonth} tháng',
          style: AppTextStyles.labelSmallLight.copyWith(
            color: context.colors.contentSpecialText,
          ),
        ),
      ],
    );
  }
}
