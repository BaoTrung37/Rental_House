import 'package:batru_house_rental/domain/use_case/article/get_article_list_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/pages/admin_post/admin_post_state.dart';
import 'package:batru_house_rental/presentation/pages/admin_post/admin_post_view_model.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/widgets/app_indicator/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _provider = StateNotifierProvider<AdminPostViewModel, AdminPostState>(
  (ref) => AdminPostViewModel(
    injector.get<GetArticleListUseCase>(),
  ),
);

class AdminPostView extends ConsumerStatefulWidget {
  const AdminPostView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends ConsumerState<AdminPostView> {
  AdminPostViewModel get _viewModel => ref.read(_provider.notifier);
  AdminPostState get _state => ref.watch(_provider);

  @override
  void dispose() {
    // TODO: implement dispose
    Future.delayed(Duration.zero, () {
      _viewModel.initData();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: context.colors.backgroundSecondary,
        appBar: AppBar(
          title: Text(
            'Duyệt bài đăng',
            style: AppTextStyles.headingXSmall
                .copyWith(color: context.colors.textPrimary),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: context.colors.backgroundPrimary,
          bottom: TabBar(
            labelColor: context.colors.information,
            unselectedLabelColor: context.colors.textSecondary,
            labelStyle: AppTextStyles.headingXSmall
                .copyWith(color: context.colors.information),
            tabs: const [
              Tab(
                text: 'Chờ duyệt',
              ),
              Tab(
                text: 'Đã duyệt',
              ),
            ],
          ),
        ),
        body: LoadingView(
          status: _state.status,
          child: TabBarView(
            children: [
              _buildArticlePeddingView(),
              _buildArticleApprovedView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticleApprovedView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Text(
            // 'Số phòng: ${_state.articleApprovedList.length}',
            'Số phòng: ${1}',
            style: AppTextStyles.headingXSmall,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: _buildApprovedHouseList(),
          ),
        ],
      ),
    );
  }

  Widget _buildArticlePeddingView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Text(
            // 'Số phòng: ${_state.articlePeddingList.length}',
            'Số phòng: ${1}',
            style: AppTextStyles.headingXSmall,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: _buildPeddingHouseList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPeddingHouseList() {
    // final articlePeddingList = _state.articlePeddingList;
    return GridView.builder(
      itemCount: 1,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 220,
        childAspectRatio: 0.80,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) =>
          //  RelativeHouseItemView(
          //   articleEntity: articlePeddingList[index],
          //   onTap: () {
          //     ref.read(appNavigatorProvider).navigateTo(
          //           AppRoutes.houseDetail,
          //           arguments: HouseDetailArguments(
          //             houseId: articlePeddingList[index].id,
          //           ),
          //         );
          //   },
          // ),
          Container(
        color: Colors.red,
      ),
      shrinkWrap: true,
    );
  }

  Widget _buildApprovedHouseList() {
    // final articleApprovedList = _state.articleApprovedList;
    return GridView.builder(
      itemCount: 1,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 220,
        childAspectRatio: 0.80,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) =>
          // RelativeHouseItemView(
          //   articleEntity: articleApprovedList[index],
          //   onTap: () {
          //     ref.read(appNavigatorProvider).navigateTo(
          //           AppRoutes.houseDetail,
          //           arguments: HouseDetailArguments(
          //             houseId: articleApprovedList[index].id,
          //           ),
          //         );
          //   },
          // ),
          Container(
        color: Colors.red,
      ),
      shrinkWrap: true,
    );
  }
}
