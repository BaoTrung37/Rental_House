import 'package:batru_house_rental/data/providers/app_navigator_provider.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/pages/home/home_state.dart';
import 'package:batru_house_rental/presentation/pages/home/home_view_model.dart';
import 'package:batru_house_rental/presentation/pages/home/widgets/home_place_small_card.dart';
import 'package:batru_house_rental/presentation/pages/home/widgets/home_search_card_view.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/widgets/buttons/app_button.dart';
import 'package:batru_house_rental/presentation/widgets/cards/info_room_horizontal_small_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _provider = StateNotifierProvider<HomeViewModel, HomeState>(
  (ref) => HomeViewModel(),
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

  @override
  void initState() {
    // TODO: implement initState
    _viewModel.init();
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
      body: Stack(
        children: [
          _buildBody(context),
          Positioned(
            bottom: 10,
            left: 130,
            right: 130,
            child: AppButton(
              leftIcon: AppIcons.add(
                color: Colors.white,
              ),
              title: 'Đăng bài',
              onButtonTap: () {
                ref
                    .read(appNavigatorProvider)
                    .navigateTo(AppRoutes.postArticle);
              },
            ),
          ),
        ],
      ),
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
                const HomeSearchCardView(),
                const SizedBox(height: 24),
                _buildPlaceTitle(),
                const SizedBox(height: 40),
                _buildSearchTrendListView(context),
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
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => InfoRoomHorizontalCardItemItem(
                onTap: () {
                  ref
                      .read(appNavigatorProvider)
                      .navigateTo(AppRoutes.roomDetail);
                },
              ),
              childCount: 10,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSlider(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .25,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondary,
      ),
      child: Image.network(
        mockThumbnail,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildBanner(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.15,
      child: _buildImage(mockThumbnail),
    );
  }

  Widget _buildSearchTrendListView(BuildContext context) {
    return GridView.builder(
      // config list view not scroll on column
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => HomePlaceSmallCard(
        onTap: () {
          ref.read(appNavigatorProvider).navigateTo(AppRoutes.search);
        },
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildPlaceTitle() => const Text(
        'Địa điểm nổi bật',
        style: AppTextStyles.headingSmall,
      );
}
