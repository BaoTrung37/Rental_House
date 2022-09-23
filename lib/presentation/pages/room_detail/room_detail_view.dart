import 'dart:ui';

import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/widgets/app_divider/app_divider.dart';
import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoomDetailView extends ConsumerStatefulWidget {
  const RoomDetailView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RoomDetailViewState();
}

class _RoomDetailViewState extends ConsumerState<RoomDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar.titleAndBackButton(
        title: 'Chi tiết phòng',
        shouldShowBottomDivider: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                  _buildBigDivider(),
                  _buildNoteTitle(),
                  // Add luu y
                  _buildBigDivider(),
                  _buildDetailTitle(),
                  const SizedBox(height: 10),
                  _buildDetailText(context),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: AppDivider(height: 1),
                  ),
                  _buildSeeMoreOrCollapseButton(context),
                  _buildBigDivider(),
                  _buildLocationTitle(),
                  const SizedBox(height: 10),
                  _buildSpecificAddressView(context),
                  const SizedBox(height: 10),
                  _buildSpecificPhoneNumberView(context),
                  _buildBigDivider(),
                  _buildConvenientTitle(),
                  const SizedBox(height: 10),
                  _buildConvenientView(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
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
            style: AppTextStyles.textSmall.copyWith(
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
            style: AppTextStyles.textSmall.copyWith(
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
      height: 65,
      child: Text(
        'hahahhahahhahahhahahhahahh,ahahhahahhahahhahahhahahhah,ahhahahhahahhahahhahahhahahhaha,hhahahhahahhahahhahahh,ahahhahahhahahhahahha,hahhahah,,hahahhahahhahahhahahh,ahahhahahhahahhahahhahahhahahhah,ahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahahhahah',
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: AppTextStyles.textSmall.copyWith(
          color: context.colors.textPrimary,
        ),
      ),
    );
  }

  Text _buildDetailTitle() =>
      const Text('Chi tiết', style: AppTextStyles.headingXSmall);

  Text _buildNoteTitle() =>
      const Text('Lưu ý', style: AppTextStyles.headingXSmall);

  Padding _buildBigDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: AppDivider(height: 1, thickness: 6),
    );
  }

  Center _buildRoomPrice(BuildContext context) {
    return Center(
      child: Text(
        'Giá phòng: xxx triệu VND/phòng',
        style: AppTextStyles.textMedium.copyWith(
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
      style: AppTextStyles.labelXSmallLight.copyWith(
        color: context.colors.textSecondary,
      ),
    );
  }

  Widget _buildRoomStatusInfo(BuildContext context) {
    return Column(
      children: [
        Text(
          'CÒN PHÒNG',
          style: AppTextStyles.labelXSmallLight.copyWith(
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
          style: AppTextStyles.labelXSmallLight.copyWith(
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
          style: AppTextStyles.labelXSmallLight.copyWith(
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

  Widget _buildConvenientView(BuildContext context) {
    return const Text('kok0');
  }
}
