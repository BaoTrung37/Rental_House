import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

class AuthenticationButton extends StatelessWidget {
  const AuthenticationButton({
    required this.title,
    required this.color,
    required this.icon,
    this.onButtonTap,
    this.textStyle,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onButtonTap;
  final Color color;
  final Widget icon;
  final String title;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onButtonTap,
        child: IntrinsicHeight(
          child: Row(
            children: [
              _iconView(context),
              _titleView(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconView(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.backgroundPrimary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
        border: Border.all(color: color),
      ),
      alignment: Alignment.center,
      width: 46,
      child: icon,
    );
  }

  Widget _titleView(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: textStyle ??
              AppTextStyles.labelLarge.copyWith(
                color: context.colors.textContrastOnDark,
              ),
        ),
      ),
    );
  }
}
