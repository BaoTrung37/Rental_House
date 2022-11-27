import 'package:batru_house_rental/presentation/pages/search/search_state.dart';
import 'package:batru_house_rental/presentation/pages/search/search_view.dart';
import 'package:batru_house_rental/presentation/pages/search/search_view_model.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/widgets/app_divider/app_divider.dart';
import 'package:batru_house_rental/presentation/widgets/buttons/app_button.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterDrawerView extends ConsumerStatefulWidget {
  const FilterDrawerView({
    required this.scaffoldKey,
    required this.onApplyFilter,
    Key? key,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  final VoidCallback onApplyFilter;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FilterDrawerViewState();
}

class _FilterDrawerViewState extends ConsumerState<FilterDrawerView> {
  SearchViewModel get _viewModel => ref.read(searchProvider.notifier);
  SearchState get _state => ref.watch(searchProvider);

  var district = '';
  var commune = '';
  var type = '';

  // Future<void> onConfirmButton() async {
  //   await _viewModel.onDistrictChanged(district);
  //   await _viewModel.onCommuneChanged(commune);
  //   _viewModel.onConfirmFilter(district, commune, type);
  //   widget.scaffoldKey.currentState!.closeEndDrawer();
  // }

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
                // _buildConvenientTitle(),
                // _buildConvenientSelectView(),
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
        onButtonTap: widget.onApplyFilter,
      ),
    );
  }

  // SliverPadding _buildConvenientSelectView() {
  //   return SliverPadding(
  //     padding: const EdgeInsets.all(8),
  //     sliver: SliverGrid(
  //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 3,
  //         mainAxisSpacing: 10,
  //         crossAxisSpacing: 10,
  //         childAspectRatio: 1.5,
  //       ),
  //       delegate: SliverChildBuilderDelegate(
  //         (context, index) => Container(
  //           decoration: BoxDecoration(
  //             color: context.colors.action.withOpacity(0.5),
  //           ),
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 4),
  //             child: Row(
  //               children: [
  //                 Container(
  //                   width: 20,
  //                   height: 20,
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(15),
  //                   ),
  //                   child: const Image(
  //                     image: AssetImage(
  //                       AppImages.tv,
  //                     ),
  //                   ),
  //                 ),
  //                 const SizedBox(width: 4),
  //                 Flexible(
  //                   child: Text(
  //                     'Bình nước nóng',
  //                     style: AppTextStyles.textSmall.copyWith(
  //                       color: context.colors.textPrimary,
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         childCount: 6,
  //       ),
  //     ),
  //   );
  // }

  // SliverPadding _buildConvenientTitle() {
  //   return const SliverPadding(
  //     padding: EdgeInsets.all(8),
  //     sliver: SliverToBoxAdapter(
  //       child: Text(
  //         'Tiện ích',
  //         style: AppTextStyles.headingSmall,
  //       ),
  //     ),
  //   );
  // }

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
      sliver: SliverToBoxAdapter(
        child: DropdownSearch<String>(
          popupProps: const PopupProps.menu(
            constraints: BoxConstraints(
              maxHeight: 220,
            ),
            showSelectedItems: true,
            fit: FlexFit.loose,
          ),
          clearButtonProps: ClearButtonProps(
            icon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () async {
                await _viewModel.onTypeChanged(null);
              },
            ),
            isVisible: true,
          ),
          items: _state.types.map((element) => element.name).toList(),
          dropdownDecoratorProps: const DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: 'Loại phòng',
              hintText: 'Bấm để chọn loại phòng',
            ),
          ),
          onChanged: (value) async {
            await _viewModel.onTypeChanged(value);
          },
          selectedItem: _state.currentType?.name,
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
    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            DropdownSearch<String>(
              popupProps: const PopupProps.menu(
                constraints: BoxConstraints(
                  maxHeight: 220,
                ),
                showSelectedItems: true,
              ),
              clearButtonProps: ClearButtonProps(
                icon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () async {
                    await _viewModel.onDistrictChanged(null);
                  },
                ),
                isVisible: true,
              ),
              items: _state.districts.map((e) => e.name).toList(),
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: 'Quận/Huyện',
                  hintText: 'Bấm để chọn quận/huyện',
                ),
              ),
              onChanged: (value) async {
                await _viewModel.onDistrictChanged(value!);
                // district = value!;
                // print(district);
              },
              selectedItem: _state.currentDistrict?.name,
            ),
            DropdownSearch<String>(
              popupProps: const PopupProps.menu(
                constraints: BoxConstraints(
                  maxHeight: 220,
                ),
                showSelectedItems: true,
              ),

              clearButtonProps: ClearButtonProps(
                icon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () async {
                    await _viewModel.onCommuneChanged(null);
                  },
                ),
                isVisible: true,
              ),
              asyncItems: (filter) async {
                return _state.communes.map((e) => e.name).toList();
              },
              // items: _state.communes.map((e) => e.name).toList(),
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: 'Phường/Xã',
                  hintText: 'Bấm để chọn phường/xã',
                ),
              ),
              onChanged: (value) async {
                await _viewModel.onCommuneChanged(value);
                // commune = value!;
                // print(commune);
              },
              selectedItem: _state.currentCommune?.name,
            ),
          ],
        ),
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
          ],
        ),
      ),
    );
  }
}
