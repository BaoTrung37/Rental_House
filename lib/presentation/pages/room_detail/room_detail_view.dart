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
      body: Column(
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
                Text(
                  'TÌM NGƯỜI THUÊ.',
                  style: AppTextStyles.labelXSmallLight.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Phòng cho thuê ở Hà Nội, OK,Phòng cho thuê ở Hà Nội, OK',
                  style: AppTextStyles.headingSmall.copyWith(
                    color: context.colors.textPrimary,
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    'Giá phòng: xxx triệu VND/phòng',
                    style: AppTextStyles.textMedium.copyWith(
                      color: context.colors.contentSpecialMain,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildRoomStatusInfo(context),
                    _buildRoomAreaInfo(context),
                    _buildRoomDepositInfo(context),
                  ],
                ),
                const SizedBox(height: 16),
                const AppDivider(height: 1),
                const SizedBox(height: 16),
              ],
            ),
          )
        ],
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
}
