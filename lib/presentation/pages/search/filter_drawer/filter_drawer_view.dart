import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/widgets/app_divider/app_divider.dart';
import 'package:batru_house_rental/presentation/widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterDrawerView extends ConsumerStatefulWidget {
  const FilterDrawerView({Key? key}) : super(key: key);

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
                SliverPadding(
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
                ),
                const SliverToBoxAdapter(
                  child: AppDivider(
                    height: 1,
                    thickness: 0.5,
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(8),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                            'Quận Hà Đông',
                            style: AppTextStyles.textSmall,
                          ),
                        ),
                      ),
                      childCount: 10,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: AppDivider(
                    height: 1,
                    thickness: 0.5,
                  ),
                ),
                const SliverPadding(
                  padding: EdgeInsets.all(8),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Loại phòng',
                      style: AppTextStyles.headingSmall,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: AppDivider(
                    height: 1,
                    thickness: 0.5,
                  ),
                ),
                const SliverPadding(
                  padding: EdgeInsets.all(8),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Các loại sẽ thêm sau',
                      style: AppTextStyles.headingSmall,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: AppDivider(
                    height: 1,
                    thickness: 0.5,
                  ),
                ),
                const SliverPadding(
                  padding: EdgeInsets.all(8),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Giá phòng',
                      style: AppTextStyles.headingSmall,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: AppDivider(
                    height: 1,
                    thickness: 0.5,
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(8),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                            style: AppTextStyles.textSmall,
                          ),
                        ),
                      ),
                      childCount: 6,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: AppDivider(
                    height: 1,
                    thickness: 0.5,
                  ),
                ),
                const SliverPadding(
                  padding: EdgeInsets.all(8),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Tiện ích',
                      style: AppTextStyles.headingSmall,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(8),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: AppButton(
              isExpanded: true,
              title: 'Xác nhận',
              onButtonTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
