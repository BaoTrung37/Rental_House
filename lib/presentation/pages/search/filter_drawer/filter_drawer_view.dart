import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/widgets/app_divider/app_divider.dart';
import 'package:batru_house_rental/presentation/widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';

class FilterDrawerView extends StatefulWidget {
  const FilterDrawerView({
    required this.scaffoldKey,
    Key? key,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<FilterDrawerView> createState() => _FilterDrawerViewState();
}

class _FilterDrawerViewState extends State<FilterDrawerView> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.colors.backgroundPrimary,
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                ///
                _buildPlaceTitle(),
                _buildPlaceView(),

                ///
                _buildHorizontalDivider(),
                _buildTypeRoomTitle(),
                _buildTypeRoomView(),

                ///
                _buildHorizontalDivider(),
                _buildPriceRoomTitle(),
                _buildPriceRoomView(),

                ///
                _buildHorizontalDivider(),
                _buildConvinientTitle(),
                _buildConvinientView(),

                ///
              ],
            ),
          ),
          _buildConfirmButton(),
        ],
      ),
    );
  }

  Widget _buildConfirmButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: AppButton(
        isExpanded: true,
        title: 'Xác nhận',
        onButtonTap: () {
          widget.scaffoldKey.currentState!.closeEndDrawer();
        },
      ),
    );
  }

  SliverPadding _buildConvinientView() {
    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 2,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => Container(
            decoration: BoxDecoration(
              color: context.colors.action.withOpacity(0.5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Image(
                      image: AssetImage(
                        AppImages.tv,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      'Bình nước nóng',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.textSmall.copyWith(
                        color: context.colors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          childCount: 6,
        ),
      ),
    );
  }

  SliverPadding _buildConvinientTitle() {
    return const SliverPadding(
      padding: EdgeInsets.all(8),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Tiện ích',
          style: AppTextStyles.headingSmall,
        ),
      ),
    );
  }

  SliverPadding _buildPriceRoomView() {
    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 2,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => Container(
            decoration: BoxDecoration(
              color: context.colors.action.withOpacity(0.5),
            ),
            child: const Center(
              child: Flexible(
                child: Text(
                  'Dưới 1 triệu',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.textSmall,
                ),
              ),
            ),
          ),
          childCount: 6,
        ),
      ),
    );
  }

  SliverPadding _buildPriceRoomTitle() {
    return const SliverPadding(
      padding: EdgeInsets.all(8),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Giá phòng',
          style: AppTextStyles.headingSmall,
        ),
      ),
    );
  }

  SliverPadding _buildTypeRoomView() {
    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 2,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => Container(
            decoration: BoxDecoration(
              color: context.colors.action.withOpacity(0.5),
            ),
            child: const Center(
              child: Flexible(
                child: Text(
                  'Phòng cho thuê',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.textSmall,
                ),
              ),
            ),
          ),
          childCount: 4,
        ),
      ),
    );
  }

  SliverPadding _buildTypeRoomTitle() {
    return const SliverPadding(
      padding: EdgeInsets.all(8),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Loại phòng',
          style: AppTextStyles.headingSmall,
        ),
      ),
    );
  }

  SliverPadding _buildPlaceView() {
    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 2,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => Container(
            decoration: BoxDecoration(
              color: context.colors.action.withOpacity(0.5),
            ),
            child: const Center(
              child: Flexible(
                child: Text(
                  'Quận Hoàng Mai',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.textSmall,
                ),
              ),
            ),
          ),
          childCount: 10,
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildHorizontalDivider() {
    return const SliverToBoxAdapter(
      child: AppDivider(
        height: 1,
        thickness: 0.5,
      ),
    );
  }

  SliverPadding _buildPlaceTitle() {
    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Địa điểm',
              style: AppTextStyles.headingSmall,
            ),
            Text(
              '3 lựa chọn',
              style: AppTextStyles.headingXSmallLight,
            ),
          ],
        ),
      ),
    );
  }
}
