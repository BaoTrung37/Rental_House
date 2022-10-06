import 'package:batru_house_rental/data/models/room/room_dto.dart';
import 'package:batru_house_rental/presentation/pages/search/widget/room_type_item_view.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/widgets/app_divider/app_divider.dart';
import 'package:batru_house_rental/presentation/widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterDrawerView extends ConsumerStatefulWidget {
  const FilterDrawerView({
    required this.scaffoldKey,
    Key? key,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FilterDrawerViewState();
}

class _FilterDrawerViewState extends ConsumerState<FilterDrawerView> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.colors.backgroundPrimary,
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                _buildPlaceTitleView(),
                const SliverToBoxAdapter(
                  child: AppDivider(
                    height: 1,
                    thickness: 0.5,
                  ),
                ),
                _buildPlaceSelectView(),
                const SliverToBoxAdapter(
                  child: AppDivider(
                    height: 1,
                    thickness: 0.5,
                  ),
                ),
                _buildRoomTypeTitle(),
                const SliverToBoxAdapter(
                  child: AppDivider(
                    height: 1,
                    thickness: 0.5,
                  ),
                ),
                _buildRoomTypeSelectView(),
                const SliverToBoxAdapter(
                  child: AppDivider(
                    height: 1,
                    thickness: 0.5,
                  ),
                ),
                _buildPriceRoomTitle(),
                const SliverToBoxAdapter(
                  child: AppDivider(
                    height: 1,
                    thickness: 0.5,
                  ),
                ),
                _buildPriceRoomSelectView(),
                const SliverToBoxAdapter(
                  child: AppDivider(
                    height: 1,
                    thickness: 0.5,
                  ),
                ),
                _buildConvenientTitle(),
                _buildConvenientSelectView(),
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
        onButtonTap: () {},
      ),
    );
  }

  SliverPadding _buildConvenientSelectView() {
    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.5,
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

  SliverPadding _buildConvenientTitle() {
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

  SliverPadding _buildPriceRoomSelectView() {
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
              child: Text(
                'Dưới 1 triệu',
                style: AppTextStyles.textMedium,
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

  SliverPadding _buildRoomTypeSelectView() {
    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          RoomType.values
              .map(
                (e) => RoomTypeItemView(
                  roomType: e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  SliverPadding _buildRoomTypeTitle() {
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

  SliverPadding _buildPlaceSelectView() {
    final list = <String>['Hà Đông', 'Cầu Giấy', 'Hoàn Kiếm', 'Tây Hồ'];
    var dropdownValue = list.first;
    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          DropdownButtonFormField<String>(
            value: dropdownValue,
            style: AppTextStyles.textMedium
                .copyWith(color: context.colors.textPrimary),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          DropdownButtonFormField<String>(
            value: dropdownValue,
            style: AppTextStyles.textMedium
                .copyWith(color: context.colors.textPrimary),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ]),
      ),
    );
  }

  SliverPadding _buildPlaceTitleView() {
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
