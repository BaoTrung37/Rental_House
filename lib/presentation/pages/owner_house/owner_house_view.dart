import 'package:batru_house_rental/data/providers/app_navigator_provider.dart';
import 'package:batru_house_rental/domain/use_case/article/get_articles_by_user_id_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/get_current_user_information_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/pages/house_detail/house_detail_view.dart';
import 'package:batru_house_rental/presentation/pages/house_detail/widgets/relative_house_item_view.dart';
import 'package:batru_house_rental/presentation/pages/owner_house/owner_house_state.dart';
import 'package:batru_house_rental/presentation/pages/owner_house/owner_house_view_model.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/widgets/app_indicator/loading_view.dart';
import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _familyProvider = StateNotifierProvider.family
    .autoDispose<OwnerHouseViewModel, OwnerHouseState, String>(
  (ref, argument) => OwnerHouseViewModel(
    injector.get<GetArticlesByUserIdUseCase>(),
    injector.get<GetCurrentUserInformationUseCase>(),
  ),
);

class OnwerHouseArguments {
  OnwerHouseArguments({
    required this.userId,
  });
  final String userId;
}

class OwnerHouseView extends ConsumerStatefulWidget {
  const OwnerHouseView({
    required this.arguments,
    Key? key,
  }) : super(key: key);
  final OnwerHouseArguments arguments;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OwnerHouseViewState();
}

class _OwnerHouseViewState extends ConsumerState<OwnerHouseView> {
  late final _provider = _familyProvider(widget.arguments.userId);
  OwnerHouseViewModel get _viewModel => ref.read(_provider.notifier);
  OwnerHouseState get _state => ref.watch(_provider);

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await _viewModel.initData(widget.arguments.userId);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundSecondary,
      appBar: const BaseAppBar.titleAndBackButton(title: 'Phòng đã đăng'),
      body: LoadingView(
        status: _state.status,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                'Số phòng: ${_state.houseArticleList.length}',
                style: AppTextStyles.headingXSmall,
              ),
              const SizedBox(height: 10),
              Expanded(
                child: _buildHouseList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHouseList() {
    final houseArticleList = _state.houseArticleList;
    return GridView.builder(
      itemCount: houseArticleList.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 220,
        childAspectRatio: 0.80,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => RelativeHouseItemView(
        articleEntity: houseArticleList[index],
        onTap: () {
          ref.read(appNavigatorProvider).navigateTo(
                AppRoutes.houseDetail,
                arguments: HouseDetailArguments(
                  houseId: houseArticleList[index].id,
                ),
              );
        },
      ),
      // Container(color: Colors.red),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
