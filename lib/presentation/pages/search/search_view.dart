import 'package:batru_house_rental/data/providers/app_navigator_provider.dart';
import 'package:batru_house_rental/domain/use_case/article/get_article_filter_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/commune/get_commune_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/district/get_district_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/province/get_province_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/type/get_type_list_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/pages/article_detail/article_detail_view.dart';
import 'package:batru_house_rental/presentation/pages/search/filter_drawer/filter_drawer_view.dart';
import 'package:batru_house_rental/presentation/pages/search/search_state.dart';
import 'package:batru_house_rental/presentation/pages/search/search_view_model.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/widgets/app_indicator/loading_view.dart';
import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:batru_house_rental/presentation/widgets/cards/info_room_horizontal_small_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider =
    StateNotifierProvider.autoDispose<SearchViewModel, SearchState>(
  (ref) => SearchViewModel(
    injector.get<GetTypeListUseCase>(),
    injector.get<GetProvinceListUseCase>(),
    injector.get<GetDistrictListUseCase>(),
    injector.get<GetCommuneListUseCase>(),
    injector.get<GetArticleFilterListUseCase>(),
  ),
);

class SearchArguments {
  SearchArguments({
    this.districtId,
  });
  final String? districtId;
}

class SearchView extends ConsumerStatefulWidget {
  const SearchView({
    required this.arguments,
    Key? key,
  }) : super(key: key);

  final SearchArguments arguments;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView> {
  SearchViewModel get _viewModel => ref.read(searchProvider.notifier);
  SearchState get _state => ref.watch(searchProvider);
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      if (widget.arguments.districtId != null) {
        await _viewModel.initDataWithDisstrictId(widget.arguments.districtId!);
      } else {
        await _viewModel.initData();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: const Text(
          'Tìm kiếm phòng',
          style: AppTextStyles.headingXSmall,
        ),
        widgets: [
          IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openEndDrawer();
            },
            icon: AppIcons.filter(color: Colors.black, size: 24),
          ),
        ],
      ),
      body: LoadingView(
        status: _state.status,
        child: _buildBody(),
      ),
    );
  }

  Scaffold _buildBody() {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: FilterDrawerView(
        scaffoldKey: scaffoldKey,
        onApplyFilter: () async {
          await _viewModel.getArticleFilterList();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${_state.articles.length} Kết quả phù hợp',
                    style: AppTextStyles.headingSmall,
                  ),
                ),
                // IconButton(
                //   onPressed: () {
                //     scaffoldKey.currentState!.openEndDrawer();
                //   },
                //   icon: AppIcons.filter(color: Colors.black, size: 24),
                // ),
              ],
            ),
            Expanded(
              child: _buildArticleList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleList() {
    final articles = _state.articles;
    return ListView.builder(
      itemBuilder: (context, index) => InfoRoomHorizontalCardItemItem(
        articleEntity: articles[index],
        onTap: () {
          ref.read(appNavigatorProvider).navigateTo(
                AppRoutes.postDetail,
                arguments: ArticleDetailArguments(
                  postId: articles[index].post!.id,
                ),
              );
        },
      ),
      itemCount: articles.length,
    );
  }
}
