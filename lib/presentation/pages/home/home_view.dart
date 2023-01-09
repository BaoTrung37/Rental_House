import 'package:batru_house_rental/data/providers/app_navigator_provider.dart';
import 'package:batru_house_rental/domain/use_case/article/get_approved_article_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/district/get_district_list_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/pages/article_detail/article_detail_view.dart';
import 'package:batru_house_rental/presentation/pages/home/home_state.dart';
import 'package:batru_house_rental/presentation/pages/home/home_view_model.dart';
import 'package:batru_house_rental/presentation/pages/home/views/home_place_small_card.dart';
import 'package:batru_house_rental/presentation/pages/search/search_view.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:batru_house_rental/presentation/widgets/app_indicator/loading_view.dart';
import 'package:batru_house_rental/presentation/widgets/cards/info_room_horizontal_small_card_item.dart';
import 'package:batru_house_rental/presentation/widgets/image/image_with_border.dart';
import 'package:batru_house_rental/presentation/widgets/infinite_list/refresh_view.dart';
import 'package:batru_house_rental/presentation/widgets/snack_bar/error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeState>(
  (ref) => HomeViewModel(
    // injector.get<GetInitialArticleDataUseCase>(),
    injector.get<GetDistrictListUseCase>(),
    injector.get<GetApprovedArticleListUseCase>(),
  ),
);

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  HomeViewModel get _viewModel => ref.read(homeViewProvider.notifier);
  HomeState get _state => ref.watch(homeViewProvider);

  final ScrollController _scrollController = ScrollController();
  bool isShowPostArticle = false;
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await _viewModel.initData();
    });

    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.extentAfter) {
      setState(() {
        isShowPostArticle = true;
      });
    } else {
      setState(() {
        isShowPostArticle = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    ref.listen<HomeState>(homeViewProvider, (previous, next) {
      if (next.status == LoadingStatus.error &&
          next.status != previous?.status) {
        showErrorSnackBar(
          context: context,
          errorMessage: next.appError,
        );
      }
      if (next.shouldReLoadData) {
        _viewModel.initData();
        _viewModel.setShouldReloadData(false);
      }
    });
    return Scaffold(
      backgroundColor: context.colors.backgroundSecondary,
      body: RefreshView(
        onRefresh: () async {
          await _viewModel.initData();
        },
        color: Colors.transparent,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onOverScroll: (mode, distance, limit) {
          switch (mode) {
            case RefreshIndicatorMode.drag:
            case RefreshIndicatorMode.armed:
            case RefreshIndicatorMode.snap:
            default:
              setState(() {});
              break;
          }
        },
        child: LoadingView(
          status: _state.status,
          child: _buildBodyView(context),
        ),
      ),
    );
  }

  Widget _buildBodyView(BuildContext context) {
    return Stack(
      children: [
        _buildBody(context),
        if (!isShowPostArticle)
          Positioned(
            bottom: 10,
            right: 10,
            child: GestureDetector(
              onTap: () {
                ref
                    .read(appNavigatorProvider)
                    .navigateTo(AppRoutes.postArticle);
              },
              child: CircleAvatar(
                minRadius: 24,
                child: AppIcons.add(
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }

  CustomScrollView _buildBody(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: _buildSlider(context),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                // const HomeSearchCardView(),
                const SizedBox(height: 24),
                _buildPlaceTitle(),
                const SizedBox(height: 10),
                _buildSearchFamousListView(context),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildBanner(context),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        _buildHouseArticleListView(),
      ],
    );
  }

  SliverPadding _buildHouseArticleListView() {
    final houseArticleList = _state.houseArticleList;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => InfoRoomHorizontalCardItemItem(
            articleEntity: houseArticleList[index],
            onTap: () async {
              await ref.read(appNavigatorProvider).navigateTo(
                    AppRoutes.postDetail,
                    arguments: ArticleDetailArguments(
                      postId: houseArticleList[index].id,
                    ),
                  );
            },
          ),
          childCount: houseArticleList.length,
        ),
      ),
    );
  }

  Widget _buildSlider(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondary,
      ),
      child: _buildImage(),
    );
  }

  Widget _buildBanner(BuildContext context) {
    return SizedBox(
      child: _buildImage(),
    );
  }

  Widget _buildSearchFamousListView(BuildContext context) {
    final famousDistrictList = ref.watch(homeViewProvider).famousDistrictList;
    return GridView.builder(
      // config list view not scroll on column
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: famousDistrictList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) => HomePlaceSmallCard(
        district: famousDistrictList[index],
        onTap: () {
          ref.read(appNavigatorProvider).navigateTo(
                AppRoutes.search,
                arguments: SearchArguments(
                  districtId: famousDistrictList[index].id,
                ),
              );
        },
      ),
    );
  }

  Widget _buildImage() {
    return ImageWithBorder(
      aspectRatio: 3,
      url:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR21hT8DpLDp4fyJzRHGFoZpPCX2MXdsR50nA&usqp=CAU',
      borderRadius: BorderRadius.circular(10),
    );
  }

  Widget _buildPlaceTitle() => const Text(
        'Địa điểm nổi bật',
        style: AppTextStyles.headingSmall,
      );
}
