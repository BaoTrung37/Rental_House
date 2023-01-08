// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:batru_house_rental/data/providers/app_navigator_provider.dart';
import 'package:batru_house_rental/domain/use_case/article/get_articles_by_user_id_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/pages/article_detail/article_detail_view.dart';
import 'package:batru_house_rental/presentation/pages/article_detail/widgets/relative_house_item_view.dart';
import 'package:batru_house_rental/presentation/pages/more_article/more_article_state.dart';
import 'package:batru_house_rental/presentation/pages/more_article/more_article_view_model.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/widgets/app_indicator/loading_view.dart';
import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _provider = StateNotifierProvider<MoreArticleViewModel, MoreArticleState>(
  (ref) => MoreArticleViewModel(
    injector.get<GetArticlesByUserIdUseCase>(),
  ),
);

class MoreArticleArguments {
  const MoreArticleArguments({
    required this.userId,
  });
  final String userId;
}

class MoreArticleView extends ConsumerStatefulWidget {
  const MoreArticleView({
    required this.arguments,
    super.key,
  });

  final MoreArticleArguments arguments;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MoreArticleViewState();
}

class _MoreArticleViewState extends ConsumerState<MoreArticleView> {
  MoreArticleViewModel get _viewModel => ref.read(_provider.notifier);
  MoreArticleState get _state => ref.watch(_provider);

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      _viewModel.initData(widget.arguments.userId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.customTitleView(
        title: Text(
          'Danh sách phòng',
          style: AppTextStyles.headingXSmall.copyWith(
            color: context.colors.textPrimary,
          ),
        ),
      ),
      body: LoadingView(
        status: _state.status,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Phòng đã đăng: ',
                style: AppTextStyles.headingSmall,
              ),
              const SizedBox(height: 10),
              Expanded(
                child: _buildArticleList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticleList() {
    final articleList = _state.articleList;
    return GridView.builder(
      itemCount: articleList.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 220,
        childAspectRatio: 0.80,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => RelativeHouseItemView(
        articleEntity: articleList[index],
        onTap: () {
          ref.read(appNavigatorProvider).navigateTo(
                AppRoutes.postDetail,
                arguments: ArticleDetailArguments(
                  postId: articleList[index].id,
                ),
              );
        },
      ),
      shrinkWrap: true,
    );
  }
}
