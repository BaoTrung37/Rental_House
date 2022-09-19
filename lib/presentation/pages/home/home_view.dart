import 'package:batru_house_rental/data/providers/app_navigator_provider.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/pages/home/widgets/home_info_room_horizontal_card_view.dart';
import 'package:batru_house_rental/presentation/pages/home/widgets/home_search_card_view.dart';
import 'package:batru_house_rental/presentation/resources/localizations/l10n.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final mockThumbnail =
      'https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/cat_relaxing_on_patio_other/1800x1200_cat_relaxing_on_patio_other.jpg';
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundSecondary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSlider(context),
            _buildTrendingBox(context),
            _buildRoomListView(context),
          ],
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
      child: Image.network(
        mockThumbnail,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildRoomListView(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: context.colors.backgroundPrimary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          children: [
            _buildBanner(context),
            const SizedBox(height: 10),
            _buildRoomList(),
          ],
        ),
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

  ListView _buildRoomList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) => HomeInfoRoomHorizontalCardItemView(
        onTap: () {
          ref.read(appNavigatorProvider).navigateTo(AppRoutes.roomDetail);
        },
      ),
    );
  }

  Widget _buildTrendingBox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HomeSearchCardView(),
          const SizedBox(height: 24),
          _buildSearchTrendsTitle(),
          _buildSearchTrendListView(context),
        ],
      ),
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
      itemBuilder: (context, index) => Stack(
        children: [
          _buildImage(mockThumbnail),
          Positioned(
            left: 0,
            right: 0,
            child: _buildPlaceNameTitle(context),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceNameTitle(BuildContext context) {
    return Text(
      'Bắc Từ Liêm',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: AppTextStyles.textSmallBold.copyWith(
        color: context.colors.textContrastOnContrastBackground,
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

  Widget _buildSearchTrendsTitle() => Text(
        AppLocalizations.current.home_title_search_trends,
        style: AppTextStyles.headingSmall,
      );
}
