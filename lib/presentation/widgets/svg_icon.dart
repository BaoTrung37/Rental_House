import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon {
  SvgIcon._private();

  static SvgPicture from(
    String assetName, {
    Key? key,
    double? width,
    double? height,
    double? size,
    Color? color,
    BoxFit? fit,
  }) =>
      SvgPicture.asset(
        assetName,
        key: key,
        width: size ?? width,
        height: size ?? height,
        color: color,
        fit: fit ?? BoxFit.contain,
      );

  static SvgPicture size24(
    String assetName, {
    Key? key,
    Color? color,
    BoxFit? fit,
  }) =>
      from(
        assetName,
        key: key,
        size: 24,
        color: color,
        fit: fit,
      );
}
