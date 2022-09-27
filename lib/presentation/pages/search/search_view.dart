import 'package:batru_house_rental/data/providers/app_navigator_provider.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/pages/search/filter_drawer/filter_drawer_view.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:batru_house_rental/presentation/widgets/cards/info_room_horizontal_small_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchView extends ConsumerStatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: Text('Tìm phòng'),
        widgets: [],
      ),
      body: Scaffold(
        key: scaffoldKey,
        endDrawer: FilterDrawerView(scaffoldKey: scaffoldKey),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      '30 Kết quả phù hợp',
                      style: AppTextStyles.headingSmall,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      scaffoldKey.currentState!.openEndDrawer();
                    },
                    icon: AppIcons.filter(color: Colors.black, size: 24),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      InfoRoomHorizontalCardItemItem(
                    onTap: () {
                      ref
                          .read(appNavigatorProvider)
                          .navigateTo(AppRoutes.roomDetail);
                    },
                  ),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
