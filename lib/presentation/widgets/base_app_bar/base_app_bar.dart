import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/widgets/app_divider/app_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const BaseAppBar({
    this.title,
    this.buttonTintColor,
    this.onBackButtonTap,
    this.backgroundColor,
    this.widgets,
    this.shouldShowBottomDivider = true,
    this.shouldShowBackButton = true,
    this.textColor,
    this.navigationTitle,
    Key? key,
  }) : super(key: key);

  const BaseAppBar.customTitleView({
    required this.title,
    this.onBackButtonTap,
    this.backgroundColor,
    this.buttonTintColor,
    this.widgets,
    this.shouldShowBottomDivider = true,
    this.textColor,
    Key? key,
  })  : navigationTitle = null,
        shouldShowBackButton = true,
        super(key: key);

  const BaseAppBar.titleAndBackButton({
    required String title,
    this.onBackButtonTap,
    this.backgroundColor,
    this.textColor,
    this.buttonTintColor,
    this.shouldShowBottomDivider = true,
    this.widgets,
    Key? key,
  })  : title = null,
        navigationTitle = title,
        shouldShowBackButton = true,
        super(key: key);

  const BaseAppBar.titleOnly({
    required String title,
    this.backgroundColor,
    this.textColor,
    this.shouldShowBottomDivider = true,
    this.widgets,
    Key? key,
  })  : title = null,
        onBackButtonTap = null,
        navigationTitle = title,
        buttonTintColor = null,
        shouldShowBackButton = false,
        super(key: key);

  final Widget? title;
  final String? navigationTitle;

  final Color? textColor;
  final Color? buttonTintColor;
  final Color? backgroundColor;

  final List<Widget>? widgets;

  final bool shouldShowBottomDivider;
  final bool shouldShowBackButton;

  final VoidCallback? onBackButtonTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: title ??
          Text(
            navigationTitle ?? '',
            style: AppTextStyles.headingXSmall
                .copyWith(color: textColor ?? context.colors.textPrimary),
          ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: backgroundColor ?? context.colors.backgroundPrimary,
      leading: shouldShowBackButton
          ? IconButton(
              onPressed: onBackButtonTap ??
                  () {
                    Navigator.of(context).pop();
                  },
              icon: AppIcons.back(
                color: buttonTintColor ?? context.colors.textPrimary,
              ),
            )
          : Container(),
      actions: widgets,
      bottom: shouldShowBottomDivider ? const AppBarDivider() : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarDivider extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppDivider();
  }

  @override
  Size get preferredSize => const Size.fromHeight(0.5);
}
