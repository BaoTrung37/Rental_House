import 'dart:ui';

import 'package:batru_house_rental/data/providers/app_navigator_provider.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/pages/room_detail/room_detail_state.dart';
import 'package:batru_house_rental/presentation/pages/room_detail/room_detail_view_model.dart';
import 'package:batru_house_rental/presentation/pages/room_detail/widgets/convenient_item.dart';
import 'package:batru_house_rental/presentation/pages/room_detail/widgets/relative_room_item_view.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/widgets/app_divider/app_divider.dart';
import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:batru_house_rental/presentation/widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _provider = StateNotifierProvider<RoomDetailViewModel, RoomDetailState>(
  (ref) => RoomDetailViewModel(),
);

class RoomDetailView extends ConsumerStatefulWidget {
  const RoomDetailView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RoomDetailViewState();
}

class _RoomDetailViewState extends ConsumerState<RoomDetailView> {
  RoomDetailViewModel get _viewModel => ref.read(_provider.notifier);

  @override
  void initState() {
    // TODO: implement initState
    _viewModel.init();
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
    return Scaffold(
      appBar: const BaseAppBar.titleAndBackButton(
        title: 'Chi tiết phòng',
        shouldShowBottomDivider: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildBodyView(context),
          ),
          _buildBottomApp(context)
        ],
      ),
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
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.network(
                  mockThumbnail,
                  fit: BoxFit.cover,
                ),
              ),
            ],
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    ConvenientItem(),
                    ConvenientItem(),
                    ConvenientItem(),
                  ],
                ),
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
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.5,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) => const ConvenientItem(),
            childCount: 10,
          ),
        ),
        SliverToBoxAdapter(
          child: _buildBigDivider(),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    'https://picsum.photos/200',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Nguyễn Văn A',
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
        SliverPadding(
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
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 220,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => RelativeRoomItemView(
                    onTap: () {
                      debugPrint('ontap');
                      ref
                          .read(appNavigatorProvider)
                          .navigateTo(AppRoutes.roomDetail);
                    },
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row _buildPostDateView(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.date_range_rounded,
          size: 20,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            '21 ngày trước - 30/9/2022',
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
    return Row(
      children: [
        const Icon(
          Icons.phone_enabled,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            'Số điện thoại: 0966222333',
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
            'Ngõ 1, Nguyễn Khuyến, Hà Đông, Hà Nội',
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

  SizedBox _buildDetailText(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Text(
        'hahahhahahhahahhahahhahahh,ahahhahahhahahhahahhahahhah,ahhahahhahahhahahhahahhahahhaha,hhahahhahahhahahhahahh,ahahhahahhahahhahahha,hahhahah,,hahahhahahhahahhahahh,ahahhahahhahahhahahhahahhahahhah,ahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahah',
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
        'Giá phòng: xxx triệu VND/phòng',
        style: AppTextStyles.textLarge.copyWith(
          color: context.colors.contentSpecialMain,
        ),
      ),
    );
  }

  Text _buildTitle(BuildContext context) {
    return Text(
      'Phòng cho thuê ở Hà Nội, OK,Phòng cho thuê ở Hà Nội, OK',
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
                '20m',
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
