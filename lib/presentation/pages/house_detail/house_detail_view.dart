import 'dart:ui';

import 'package:batru_house_rental/data/providers/app_navigator_provider.dart';
import 'package:batru_house_rental/domain/use_case/article/get_article_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/article/get_article_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/get_user_by_id_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/pages/house_detail/house_detail_state.dart';
import 'package:batru_house_rental/presentation/pages/house_detail/house_detail_view_model.dart';
import 'package:batru_house_rental/presentation/pages/house_detail/widgets/convenient_item.dart';
import 'package:batru_house_rental/presentation/pages/house_detail/widgets/convenient_list_item.dart';
import 'package:batru_house_rental/presentation/pages/house_detail/widgets/relative_house_item_view.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:batru_house_rental/presentation/utilities/helper/date_format_helper.dart';
import 'package:batru_house_rental/presentation/utilities/helper/number_format_helper.dart';
import 'package:batru_house_rental/presentation/widgets/app_divider/app_divider.dart';
import 'package:batru_house_rental/presentation/widgets/app_indicator/app_loading_indicator.dart';
import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:batru_house_rental/presentation/widgets/buttons/app_button.dart';
import 'package:batru_house_rental/presentation/widgets/image/image_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _familyProvider = StateNotifierProvider.autoDispose
    .family<HouseDetailViewModel, HouseDetailState, String>(
  (ref, argument) => HouseDetailViewModel(
    injector.get<GetArticleUseCase>(),
    injector.get<GetUserByIdUseCase>(),
    injector.get<GetArticleListUseCase>(),
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

  final mockThumbnail =
      'https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/cat_relaxing_on_patio_other/1800x1200_cat_relaxing_on_patio_other.jpg';
  @override
  Widget build(BuildContext context) {
    // ref.listen<HouseDetailState>(
    //   _provider,
    //   (previous, next) {
    //     if (next.getDetailLoadingStatus == LoadingStatus.error ||
    //         next.postCommentStatus == LoadingStatus.error) {
    //       showErrorSnackBar(
    //         context: context,
    //         errorMessage: next.errorMessage,
    //       );
    //     }
    //   },
    // );

    return Scaffold(
      appBar: const BaseAppBar.titleAndBackButton(
        title: 'Chi tiết phòng',
        shouldShowBottomDivider: true,
      ),
      body: state.status == LoadingStatus.initial
          ? const AppLoadingIndicator()
          : _buildBodyContent(context),
    );
  }

  Widget _buildBodyContent(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _buildBodyView(context),
        ),
        _buildBottomApp(context)
      ],
    );
  }

  Widget _buildBottomApp(BuildContext context) {
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
            AppButton(
              onButtonTap: () {},
              leftIcon: const Icon(
                Icons.chat_bubble_outline_sharp,
                color: Colors.white,
              ),
              title: 'Chat',
            ),
            AppButton(
              onButtonTap: () {},
              leftIcon: const Icon(
                Icons.phone,
                color: Colors.white,
              ),
              title: 'Gọi',
              backgroundColor: context.colors.contentAlert,
            ),
          ],
        ),
      ),
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
                  child: ListView.builder(
                    itemExtent: MediaQuery.of(context).size.width,
                    scrollDirection: Axis.horizontal,
                    itemCount: imageList.length,
                    itemBuilder: (context, index) {
                      return ImageBorder(
                        child: Image.network(
                          imageList[index].url,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        // SliverGrid(
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 1,
        //     mainAxisSpacing: 10,
        //     crossAxisSpacing: 10,
        //     childAspectRatio: 1.5,
        //   ),
        //   delegate: SliverChildBuilderDelegate(
        //     (context, index) => Container(
        //       color: Colors.black,
        //     ),
        //     childCount: 3,
        //   ),
        // ),
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
                )
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
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: AppDivider(height: 1),
                ),
                _buildSeeMoreOrCollapseButton(context),
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
                  onPressed: () {},
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

  Center _buildSeeMoreOrCollapseButton(BuildContext context) {
    return Center(
      child: Text(
        'Xem thêm',
        style: AppTextStyles.textMediumBold.copyWith(
          color: context.colors.primaryText,
        ),
      ),
    );
  }

  Widget _buildDetailText(BuildContext context) {
    final article = ref.watch(_provider).article;
    return SizedBox(
      height: 70,
      child: Text(
        article?.house?.description ?? '',
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: AppTextStyles.textMedium.copyWith(
          color: context.colors.textPrimary,
        ),
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
        'Giá phòng: ${NumberFormatHelper.formatPrice(state.article?.house?.rentalPrice ?? 0)}/phòng',
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
      'TÌM NGƯỜI THUÊ.',
      style: AppTextStyles.labelSmallLight.copyWith(
        color: context.colors.textSecondary,
      ),
    );
  }

  Widget _buildRoomStatusInfo(BuildContext context) {
    return Column(
      children: [
        Text(
          'CÒN PHÒNG',
          style: AppTextStyles.labelSmallLight.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        Text(
          'Còn',
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
          '1 Tháng',
          style: AppTextStyles.labelSmallLight.copyWith(
            color: context.colors.contentSpecialText,
          ),
        ),
      ],
    );
  }
}
