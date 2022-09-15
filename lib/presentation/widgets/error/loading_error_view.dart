import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

class LoadingErrorView extends StatelessWidget {
  const LoadingErrorView({
    required this.onReload,
    Key? key,
  }) : super(key: key);
  final VoidCallback onReload;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onReload,
        child: AppIcons.retry(
          size: 40,
          color: context.colors.iconPrimary,
        ),
      ),
    );
  }
}
