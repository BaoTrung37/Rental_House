import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

enum ButtonState {
  normal,
  loading,
  disable;
}

enum ButtonSize {
  large,
  medium,
  small,
}

enum ButtonType {
  primary,
  secondary,
  textOnly,
  red,
}

class AppButton extends StatelessWidget {
  const AppButton({
    this.leftIcon,
    this.titleView,
    this.title = '',
    this.gradient,
    this.isExpanded = false,
    this.onButtonTap,
    this.buttonState = ButtonState.normal,
    this.buttonType = ButtonType.primary,
    this.buttonSize = ButtonSize.large,
    this.textAlign,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);

  final Widget? leftIcon;
  final Widget? titleView;

  final String title;
  final Gradient? gradient;
  final bool isExpanded;
  final VoidCallback? onButtonTap;
  final TextAlign? textAlign;
  final Color? backgroundColor;

  final ButtonState buttonState;
  final ButtonType buttonType;
  final ButtonSize buttonSize;

  Color _backgroundColor(BuildContext context) {
    switch (buttonType) {
      case ButtonType.primary:
        return context.colors.primaryMain;
      case ButtonType.secondary:
        return context.colors.primaryBackground;
      case ButtonType.textOnly:
        return Colors.transparent;
      case ButtonType.red:
        return context.colors.error;
    }
  }

  Color _textColor(BuildContext context) {
    switch (buttonType) {
      case ButtonType.primary:
      case ButtonType.red:
        return context.colors.textContrastOnDark;
      case ButtonType.secondary:
        return context.colors.primaryText;
      case ButtonType.textOnly:
        return context.colors.primaryMain;
    }
  }

  TextStyle _textStyle(BuildContext context) {
    switch (buttonSize) {
      case ButtonSize.large:
        return AppTextStyles.labelLarge.copyWith(color: _textColor(context));
      case ButtonSize.medium:
        return AppTextStyles.labelMedium.copyWith(color: _textColor(context));
      case ButtonSize.small:
        return AppTextStyles.labelSmall.copyWith(color: _textColor(context));
    }
  }

  EdgeInsets defaultPadding() {
    switch (buttonSize) {
      case ButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 14);
      case ButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 8);
      case ButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 5);
    }
  }

  double _cornerRadius() {
    switch (buttonSize) {
      case ButtonSize.large:
      case ButtonSize.medium:
        return 8;
      case ButtonSize.small:
        return 4;
    }
  }

  double _height() {
    switch (buttonSize) {
      case ButtonSize.large:
        return 48;
      case ButtonSize.medium:
        return 34;
      case ButtonSize.small:
        return 24;
    }
  }

  Color _splashColor(BuildContext context) {
    switch (buttonType) {
      case ButtonType.primary:
      case ButtonType.red:
        return Colors.black.withOpacity(0.3);
      case ButtonType.secondary:
        return Colors.black.withOpacity(0.1);
      case ButtonType.textOnly:
        return Colors.transparent;
    }
  }

  VoidCallback? get _onButtonTap {
    switch (buttonState) {
      case ButtonState.normal:
        return onButtonTap;
      case ButtonState.loading:
      case ButtonState.disable:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: buttonState == ButtonState.disable ? 0.5 : 1,
      child: SizedBox(
        height: _height(),
        child: Material(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_cornerRadius())),
          child: Ink(
            decoration: BoxDecoration(
              color: backgroundColor ?? _backgroundColor(context),
              gradient: gradient,
              borderRadius: BorderRadius.circular(_cornerRadius()),
            ),
            child: InkWell(
              splashColor: _splashColor(context),
              borderRadius: BorderRadius.circular(_cornerRadius()),
              onTap: _onButtonTap,
              child: isExpanded
                  ? Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: _buttonChild(context),
                    )
                  : _buttonChild(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonChild(BuildContext context) {
    switch (buttonState) {
      case ButtonState.normal:
      case ButtonState.disable:
        return _titleView(context);
      case ButtonState.loading:
        return Padding(
          padding: defaultPadding(),
          child: SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: _textColor(context),
            ),
          ),
        );
    }
  }

  Widget _titleView(BuildContext context) {
    return Padding(
      padding: defaultPadding(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leftIcon != null) leftIcon!,
          const SizedBox(width: 4.5),
          titleView ??
              Text(
                title,
                textAlign: textAlign,
                style: _textStyle(context),
              ),
        ],
      ),
    );
  }
}
