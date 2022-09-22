import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    Key? key,
    this.height = 1,
    this.thickness = 0.5,
  }) : super(key: key);

  final double thickness;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      thickness: thickness,
      color: context.colors.border,
    );
  }
}
