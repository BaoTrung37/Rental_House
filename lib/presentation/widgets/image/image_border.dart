import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

class ImageBorder extends StatelessWidget {
  const ImageBorder({
    required this.child,
    this.borderRadius,
    Key? key,
  }) : super(key: key);
  final Widget child;
  final BorderRadius? borderRadius;
  BorderRadius get _borderRadius {
    return borderRadius ??
        const BorderRadius.all(
          Radius.circular(
            0,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: context.colors.border,
          style: BorderStyle.solid,
          width: 0.5,
        ),
        borderRadius: _borderRadius,
      ),
      child: ClipRRect(
        borderRadius: _borderRadius,
        child: child,
      ),
    );
  }
}
