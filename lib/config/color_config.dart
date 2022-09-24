import 'package:flutter/material.dart';

class FixedColors {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  FixedColors._();
  static const Color fixedPlayerBackgroundDefault = Color(0xFF000000);
  static const Color fixedPlayerBackgroundTransparent = Color(0x80000000);
  static const Color fixedPlayerBackgroundTransparentContrast =
      Color(0x66D6D6D6);
  static const Color fixedPlayerSurfaceDefault = Color(0xFF1F1F25);
  static const Color fixedPlayerAction = Color(0xFF30323F);
  static const Color fixedPlayerSurfaceContrast = Color(0xFFD6D6D6);
  static const Color fixedPlayerBorder = Color(0xFFD6D6D6);
  static const Color fixedPlayerTextPrimary = Color(0xFFFFFFFF);
  static const Color fixedPlayerTextSecondary = Color(0xFF85859F);
  static const Color fixedPlayerTextContrast = Color(0xFF000000);
  static const Color fixedPlayerIconPrimary = Color(0xFFFFFFFF);
  static const Color fixedPlayerIconSecondary = Color(0xFF4C4C63);
  static const Color fixedPlayerBrandPrimary = Color(0xFF9428E8);
  static const Color fixedPlayerBrandGradientStart = Color(0xFFB100FF);
  static const Color fixedPlayerBrandGradientEnd = Color(0xFF35A8E9);
  static const Color fixedPlayerBrandSecondary = Color(0xFF076F91);
  static const Color fixedPlayerSemanticInfo = Color(0xFF2196F3);
  static const Color fixedPlayerPlayback = Color(0xFFFD3535);
}

class LightColors {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  LightColors._();

  /// Primary
  static const primaryMain = Color(0xFF9428E8);
  static const primaryText = Color(0xFF4285F4);
  static const primaryTextOnContrast = Color(0xFFBF84ED);
  static const primaryBackground = Color(0xFFF6EBFF);

  /// Secondary
  static const secondaryMain = Color(0xFF26ACD7);
  static const secondaryText = Color(0xFF076F90);
  static const secondaryBackgroundPrimary = Color(0xFFD8F2FA);
  static const secondaryBackgroundSecondary = Color(0xFF076F91);

  /// Gradient
  static const gradientStartMain = Color(0xFFB100FF);
  static const gradientEndMain = Color(0xFF59C0FB);
  static const gradientStartBackground = Color(0x4DB100FF);
  static const gradientEndBackground = Color(0x4D35A8E9);

  /// Backgrounds
  static const backgroundPrimary = Color(0xFFFFFFFF);
  static const backgroundSecondary = Color(0xFFF6F6F6);
  static const backgroundContrast = Color(0xFF1B2124);
  static const backgroundTransparent = Color(0x66EDEDF2);

  /// Backdrops
  static const backdropPrimary = Color(0x80000000);
  static const backdropSecondary = Color(0xB3FFFFFF);

  /// Components
  static const surface = Color(0xFFFFFFFF);
  static const action = Color(0xFFEDEDF2);
  static const border = Color(0xB3C2C4CA);

  /// Text
  static const textPrimary = Color(0xFF1B2124);
  static const textSecondary = Color(0xFF797989);
  static const textContrastOnDark = Color(0xFFFFFFFF);
  static const textContrastOnLight = Color(0xFF1B2124);
  static const textContrastOnContrastBackground = Color(0xFFFFFFFF);

  /// Icons
  static const iconPrimary = Color(0xFF3F4252);
  static const iconSecondary = Color(0xFFAEB0B8);

  /// Content
  static const contentSpecialMain = Color(0xFFFD3535);
  static const contentSpecialText = Color(0xFFEA2525);
  static const contentSpecialBackground = Color(0xFFFFE9E9);
  static const contentAlert = Color(0xFFFF1F62);
  static const contentVideo = Color(0xFFD653E1);
  static const contentEntry = Color(0xFFEA6E28);
  static const contentArticle = Color(0xFF71A957);

  /// Semantic
  static const success = Color(0xFF54A447);
  static const error = Color(0xFFEE4545);
  static const information = Color(0xFF2196F3);
  static const alert = Color(0xFFFF8800);

  /// Other colors
  static const googleButton = Color(0xFF4285F4);
  static const yahooButton = Color(0xFFFF0033);
}

class DarkColors {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  DarkColors._();

  /// Primary
  static const primaryMain = Color(0xFFA33FF2);
  static const primaryText = Color(0xFF4285F4);
  static const primaryTextOnContrast = Color(0xFF5B089C);
  static const primaryBackground = Color(0xFF4C0E7C);

  /// Secondary
  static const secondaryMain = Color(0xFF28ACD6);
  static const secondaryText = Color(0xFF61C1DE);
  static const secondaryBackgroundPrimary = Color(0xFF074457);
  static const secondaryBackgroundSecondary = Color(0xFF076F91);

  /// Gradient
  static const gradientStartMain = Color(0xFFB100FF);
  static const gradientEndMain = Color(0xFF35A8E9);
  static const gradientStartBackground = Color(0x4DB100FF);
  static const gradientEndBackground = Color(0x4D35A8E9);

  /// Backgrounds
  static const backgroundPrimary = Color(0xFF0E0E0E);
  static const backgroundSecondary = Color(0xFF000000);
  static const backgroundContrast = Color(0xFFFFFFFF);
  static const backgroundTransparent = Color(0x66EDEDF2);

  /// Backdrops
  static const backdropPrimary = Color(0x80000000);
  static const backdropSecondary = Color(0xB2000000);

  /// Components
  static const surface = Color(0xFF1F1F25);
  static const action = Color(0xFF30323F);
  static const border = Color(0xB2404048);

  /// Text
  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFF85859F);
  static const textContrastOnDark = Color(0xFFFFFFFF);
  static const textContrastOnLight = Color(0xFF18181D);
  static const textContrastOnContrastBackground = Color(0xFF18181D);

  /// Icons
  static const iconPrimary = Color(0xFF6C6C86);
  static const iconSecondary = Color(0xFF4C4C63);

  /// Content
  static const contentSpecialMain = Color(0xFFFD3535);
  static const contentSpecialText = Color(0xFFFB7878);
  static const contentSpecialBackground = Color(0xFF440A0A);
  static const contentAlert = Color(0xFFFF1F62);
  static const contentVideo = Color(0xFFD653E1);
  static const contentEntry = Color(0xFFF17B39);
  static const contentArticle = Color(0xFF71A957);

  /// Semantic
  static const success = Color(0xFF54A447);
  static const error = Color(0xFFEE4545);
  static const information = Color(0xFF1D81D0);
  static const alert = Color(0xFFEB8716);

  /// Other colors
  static const googleButton = Color(0xFF4285F4);
  static const yahooButton = Color(0xFFFF0033);
}
