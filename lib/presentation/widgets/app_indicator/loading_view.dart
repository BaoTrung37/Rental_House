import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:batru_house_rental/presentation/widgets/app_indicator/app_loading_indicator.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    required this.child,
    required this.status,
    this.errorView,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Widget? errorView;
  final LoadingStatus status;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case LoadingStatus.success:
        return child;
      case LoadingStatus.initial:
      case LoadingStatus.inProgress:
        return const AppLoadingIndicator();
      case LoadingStatus.error:
        return errorView ?? Container();
    }
  }
}
