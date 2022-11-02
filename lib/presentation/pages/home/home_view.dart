import 'package:batru_house_rental/data/providers/app_navigator_provider.dart';
import 'package:batru_house_rental/domain/use_case/article/get_article_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/district/get_district_list_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/pages/home/home_state.dart';
import 'package:batru_house_rental/presentation/pages/home/home_view_model.dart';
import 'package:batru_house_rental/presentation/pages/home/widgets/home_place_small_card.dart';
import 'package:batru_house_rental/presentation/pages/house_detail/house_detail_view.dart';
import 'package:batru_house_rental/presentation/pages/search/search_view.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/widgets/app_indicator/loading_view.dart';
import 'package:batru_house_rental/presentation/widgets/buttons/app_button.dart';
import 'package:batru_house_rental/presentation/widgets/cards/info_room_horizontal_small_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _provider = StateNotifierProvider.autoDispose<HomeViewModel, HomeState>(
  (ref) => HomeViewModel(
    injector.get<GetDistrictListUseCase>(),
    injector.get<GetArticleListUseCase>(),
  ),
);

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final mockThumbnail =
      'https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/cat_relaxing_on_patio_other/1800x1200_cat_relaxing_on_patio_other.jpg';

  HomeViewModel get _viewModel => ref.read(_provider.notifier);
  HomeState get _state => ref.watch(_provider);

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await _viewModel.initData();
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundSecondary,
      body: LoadingView(
        status: _state.status,
        child: _buildBodyView(context),
      ),
    );
  }

  Widget _buildBodyView(BuildContext context) {
    return Stack(
      children: [
        _buildBody(context),
        Positioned(
          bottom: 10,
          left: 130,
          height: 40,
          right: 130,
          child: AppButton(
            leftIcon: AppIcons.add(
              color: Colors.white,
            ),
            title: 'Đăng bài',
            onButtonTap: () {
              ref.read(appNavigatorProvider).navigateTo(AppRoutes.postArticle);
            },
          ),
        ),
      ],
    );
  }

  CustomScrollView _buildBody(BuildContext context) {
    return CustomScrollView(
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
                    AppRoutes.houseDetail,
                    arguments: HouseDetailArguments(
                      houseId: houseArticleList[index].id,
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
      height: MediaQuery.of(context).size.height * .25,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondary,
      ),
      child: _buildImage(),
    );
  }

  Widget _buildBanner(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.15,
      child: _buildImage(),
    );
  }

  Widget _buildSearchFamousListView(BuildContext context) {
    final famousDistrictList = ref.watch(_provider).famousDistrictList;
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR21hT8DpLDp4fyJzRHGFoZpPCX2MXdsR50nA&usqp=CAU',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildPlaceTitle() => const Text(
        'Địa điểm nổi bật',
        style: AppTextStyles.headingSmall,
      );
}
