import 'package:batru_house_rental/config/color_config.dart';
import 'package:flutter/material.dart';

class AppColors {
  const AppColors({
    required this.primaryMain,
    required this.primaryText,
    required this.primaryTextOnContrast,
    required this.primaryBackground,
    required this.secondaryMain,
    required this.secondaryText,
    required this.secondaryBackgroundPrimary,
    required this.secondaryBackgroundSecondary,
    required this.gradientStartMain,
    required this.gradientEndMain,
    required this.gradientStartBackground,
    required this.gradientEndBackground,
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.surface,
    required this.action,
    required this.border,
    required this.backgroundContrast,
    required this.textPrimary,
    required this.textSecondary,
    required this.textContrastOnDark,
    required this.textContrastOnLight,
    required this.textContrastOnContrastBackground,
    required this.iconPrimary,
    required this.iconSecondary,
    required this.backdropPrimary,
    required this.backdropSecondary,
    required this.backgroundTransparent,
    required this.contentSpecialMain,
    required this.contentSpecialText,
    required this.contentSpecialBackground,
    required this.contentVideo,
    required this.contentArticle,
    required this.contentEntry,
    required this.contentAlert,
    required this.error,
    required this.success,
    required this.information,
    required this.alert,
    required this.fixedPlayerBackgroundDefault,
    required this.fixedPlayerBackgroundTransparent,
    required this.fixedPlayerBackgroundTransparentContrast,
    required this.fixedPlayerSurfaceDefault,
    required this.fixedPlayerAction,
    required this.fixedPlayerSurfaceContrast,
    required this.fixedPlayerBorder,
    required this.fixedPlayerTextPrimary,
    required this.fixedPlayerTextSecondary,
    required this.fixedPlayerTextContrast,
    required this.fixedPlayerIconPrimary,
    required this.fixedPlayerIconSecondary,
    required this.fixedPlayerBrandPrimary,
    required this.fixedPlayerBrandGradientStart,
    required this.fixedPlayerBrandGradientEnd,
    required this.fixedPlayerBrandSecondary,
    required this.fixedPlayerSemanticInfo,
    required this.fixedPlayerPlayback,
    required this.googleButton,
    required this.yahooButton,
  });

  /// Used for buttons colors, filled tags etc.
  final Color primaryMain;

  /// Used for text, links, icons and smaller details that require a higher contrast.
  final Color primaryText;

  /// Used for text, links, icons and smaller details that require a higher contrast over a contrast background.
  final Color primaryTextOnContrast;

  /// Used as a background color for secondary buttons, tag, banners, tooltip etc.
  final Color primaryBackground;

  /// Used for tags and other accent elements.
  final Color secondaryMain;

  /// Used for text, icons and smaller details that require a higher contrast.
  final Color secondaryText;

  /// Used as a background color for banners, tooltip etc.
  final Color secondaryBackgroundPrimary;

  /// Used as a background color for banners, tooltip etc. .
  final Color secondaryBackgroundSecondary;

  /// Gradient Start - Used for buttons colors, filled tags, icons etc.
  final Color gradientStartMain;

  /// Gradient End - Used for buttons colors, filled tags, icons etc.
  final Color gradientEndMain;

  /// Gradient Start - Used as a background color for banners, tooltip etc.
  final Color gradientStartBackground;

  /// Gradient End - Used as a background color for banners, tooltip etc.
  final Color gradientEndBackground;

  /// Used as main background color
  final Color backgroundPrimary;

  /// Used as a secondary background between sections of content.
  final Color backgroundSecondary;

  /// Used as background for cards and sheets
  final Color surface;

  /// Used as a fill color for tags, input etc.
  final Color action;

  /// Used for dividers and borders
  final Color border;

  /// Used for snackbars and other elements that need to contrast the default background
  final Color backgroundContrast;

  /// Used for primary text
  final Color textPrimary;

  /// Used for secondary text
  final Color textSecondary;

  /// Used as a contrasting text over dark fill colors
  final Color textContrastOnDark;

  /// Used as a contrasting text over light fill colors
  final Color textContrastOnLight;

  /// Text over contrast background
  final Color textContrastOnContrastBackground;

  /// Used for icon buttons etc.
  final Color iconPrimary;

  /// Used for decorative icons
  final Color iconSecondary;

  /// Used to dim the background of modals/alerts as well as for a transparent background
  final Color backdropPrimary;

  /// Used to dim the background of modals/alerts as well as for a transparent background
  final Color backdropSecondary;

  /// Used for a transparent background of login form (input)
  final Color backgroundTransparent;

  /// Used for content tags for live content and seek bar, as well as trending content
  /// Used for Label, icon etc.
  final Color contentSpecialMain;

  /// Used for text, links, icons and smaller details that require a higher contrast.
  final Color contentSpecialText;

  /// Used as a background color for secondary buttons, tag, banners, tooltip etc.
  final Color contentSpecialBackground;

  /// Used for content tags for video content
  final Color contentVideo;

  /// Used for content tags for articles
  final Color contentArticle;

  /// Used for content tags for entries
  final Color contentEntry;

  /// Used for badges to indicate new content & birthday alert
  final Color contentAlert;

  /// Used for error states
  final Color error;

  /// Used for success states
  final Color success;

  /// Used for Information states
  final Color information;

  /// Used for Alert states
  final Color alert;

  /// Other colors
  final Color googleButton;
  final Color yahooButton;

  // Fixed colors
  /// Player colors
  final Color fixedPlayerBackgroundDefault;
  final Color fixedPlayerBackgroundTransparent;
  final Color fixedPlayerBackgroundTransparentContrast;
  final Color fixedPlayerSurfaceDefault;
  final Color fixedPlayerAction;
  final Color fixedPlayerSurfaceContrast;
  final Color fixedPlayerBorder;
  final Color fixedPlayerTextPrimary;
  final Color fixedPlayerTextSecondary;
  final Color fixedPlayerTextContrast;
  final Color fixedPlayerIconPrimary;
  final Color fixedPlayerIconSecondary;
  final Color fixedPlayerBrandPrimary;
  final Color fixedPlayerBrandGradientStart;
  final Color fixedPlayerBrandGradientEnd;
  final Color fixedPlayerBrandSecondary;
  final Color fixedPlayerSemanticInfo;
  final Color fixedPlayerPlayback;
}

const colorsLight = AppColors(

    /// Primary
    primaryMain: LightColors.primaryMain,
    primaryText: LightColors.primaryText,
    primaryTextOnContrast: LightColors.primaryTextOnContrast,
    primaryBackground: LightColors.primaryBackground,

    /// Secondary
    secondaryMain: LightColors.secondaryMain,
    secondaryText: LightColors.secondaryText,
    secondaryBackgroundPrimary: LightColors.secondaryBackgroundPrimary,
    secondaryBackgroundSecondary: LightColors.secondaryBackgroundSecondary,

    /// Gradient
    gradientStartMain: LightColors.gradientStartMain,
    gradientEndMain: LightColors.gradientEndMain,
    gradientStartBackground: LightColors.gradientStartBackground,
    gradientEndBackground: LightColors.gradientEndBackground,

    /// Backgrounds
    backgroundPrimary: LightColors.backgroundPrimary,
    backgroundSecondary: LightColors.backgroundSecondary,
    backgroundContrast: LightColors.backgroundContrast,
    backgroundTransparent: LightColors.backgroundTransparent,

    /// Backdrops
    backdropPrimary: LightColors.backdropPrimary,
    backdropSecondary: LightColors.backdropSecondary,

    /// Components
    surface: LightColors.surface,
    action: LightColors.action,
    border: LightColors.border,

    /// Text
    textPrimary: LightColors.textPrimary,
    textSecondary: LightColors.textSecondary,
    textContrastOnDark: LightColors.textContrastOnDark,
    textContrastOnLight: LightColors.textContrastOnLight,
    textContrastOnContrastBackground:
        LightColors.textContrastOnContrastBackground,

    /// Icons
    iconPrimary: LightColors.iconPrimary,
    iconSecondary: LightColors.iconSecondary,

    /// Content
    contentSpecialMain: LightColors.contentSpecialMain,
    contentSpecialText: LightColors.contentSpecialText,
    contentSpecialBackground: LightColors.contentSpecialBackground,
    contentAlert: LightColors.contentAlert,
    contentVideo: LightColors.contentVideo,
    contentEntry: LightColors.contentEntry,
    contentArticle: LightColors.contentArticle,

    /// Semantic
    success: LightColors.success,
    error: LightColors.error,
    information: LightColors.information,
    alert: LightColors.alert,

    /// Other colors
    googleButton: LightColors.googleButton,
    yahooButton: LightColors.yahooButton,

    // Fixed colors

    /// Player colors
    fixedPlayerBackgroundDefault: FixedColors.fixedPlayerBackgroundDefault,
    fixedPlayerBackgroundTransparent:
        FixedColors.fixedPlayerBackgroundTransparent,
    fixedPlayerBackgroundTransparentContrast:
        FixedColors.fixedPlayerBackgroundTransparentContrast,
    fixedPlayerSurfaceDefault: FixedColors.fixedPlayerSurfaceDefault,
    fixedPlayerAction: FixedColors.fixedPlayerAction,
    fixedPlayerSurfaceContrast: FixedColors.fixedPlayerSurfaceContrast,
    fixedPlayerBorder: FixedColors.fixedPlayerBorder,
    fixedPlayerTextPrimary: FixedColors.fixedPlayerTextPrimary,
    fixedPlayerTextSecondary: FixedColors.fixedPlayerTextSecondary,
    fixedPlayerTextContrast: FixedColors.fixedPlayerTextContrast,
    fixedPlayerIconPrimary: FixedColors.fixedPlayerIconPrimary,
    fixedPlayerIconSecondary: FixedColors.fixedPlayerIconSecondary,
    fixedPlayerBrandPrimary: FixedColors.fixedPlayerBrandPrimary,
    fixedPlayerBrandGradientStart: FixedColors.fixedPlayerBrandGradientStart,
    fixedPlayerBrandGradientEnd: FixedColors.fixedPlayerBrandGradientEnd,
    fixedPlayerBrandSecondary: FixedColors.fixedPlayerBrandSecondary,
    fixedPlayerSemanticInfo: FixedColors.fixedPlayerSemanticInfo,
    fixedPlayerPlayback: FixedColors.fixedPlayerPlayback);

const colorsDark = AppColors(
  /// Primary
  primaryMain: DarkColors.primaryMain,
  primaryText: DarkColors.primaryText,
  primaryTextOnContrast: DarkColors.primaryTextOnContrast,
  primaryBackground: DarkColors.primaryBackground,

  /// Secondary
  secondaryMain: DarkColors.secondaryMain,
  secondaryText: DarkColors.secondaryText,
  secondaryBackgroundPrimary: DarkColors.secondaryBackgroundPrimary,
  secondaryBackgroundSecondary: DarkColors.secondaryBackgroundSecondary,

  /// Gradient
  gradientStartMain: DarkColors.gradientStartMain,
  gradientEndMain: DarkColors.gradientEndMain,
  gradientStartBackground: DarkColors.gradientStartBackground,
  gradientEndBackground: DarkColors.gradientEndBackground,

  /// Backgrounds
  backgroundPrimary: DarkColors.backgroundPrimary,
  backgroundSecondary: DarkColors.backgroundSecondary,
  backgroundContrast: DarkColors.backgroundContrast,
  backgroundTransparent: DarkColors.backgroundTransparent,

  /// Backdrops
  backdropPrimary: DarkColors.backdropPrimary,
  backdropSecondary: DarkColors.backdropSecondary,

  /// Components
  surface: DarkColors.surface,
  action: DarkColors.action,
  border: DarkColors.border,

  /// Text
  textPrimary: DarkColors.textPrimary,
  textSecondary: DarkColors.textSecondary,
  textContrastOnDark: DarkColors.textContrastOnDark,
  textContrastOnLight: DarkColors.textContrastOnLight,
  textContrastOnContrastBackground: DarkColors.textContrastOnContrastBackground,

  /// Icons
  iconPrimary: DarkColors.iconPrimary,
  iconSecondary: DarkColors.iconSecondary,

  /// Content
  contentSpecialMain: DarkColors.contentSpecialMain,
  contentSpecialText: DarkColors.contentSpecialText,
  contentSpecialBackground: DarkColors.contentSpecialBackground,
  contentAlert: DarkColors.contentAlert,
  contentVideo: DarkColors.contentVideo,
  contentEntry: DarkColors.contentEntry,
  contentArticle: DarkColors.contentArticle,

  /// Semantic
  success: DarkColors.success,
  error: DarkColors.error,
  information: DarkColors.information,
  alert: DarkColors.alert,

  /// Other colors
  googleButton: DarkColors.googleButton,
  yahooButton: DarkColors.yahooButton,

  // Fixed colors

  /// Player colors
  fixedPlayerBackgroundDefault: FixedColors.fixedPlayerBackgroundDefault,
  fixedPlayerBackgroundTransparent:
      FixedColors.fixedPlayerBackgroundTransparent,
  fixedPlayerBackgroundTransparentContrast:
      FixedColors.fixedPlayerBackgroundTransparentContrast,
  fixedPlayerSurfaceDefault: FixedColors.fixedPlayerSurfaceDefault,
  fixedPlayerAction: FixedColors.fixedPlayerAction,
  fixedPlayerSurfaceContrast: FixedColors.fixedPlayerSurfaceContrast,
  fixedPlayerBorder: FixedColors.fixedPlayerBorder,
  fixedPlayerTextPrimary: FixedColors.fixedPlayerTextPrimary,
  fixedPlayerTextSecondary: FixedColors.fixedPlayerTextSecondary,
  fixedPlayerTextContrast: FixedColors.fixedPlayerTextContrast,
  fixedPlayerIconPrimary: FixedColors.fixedPlayerIconPrimary,
  fixedPlayerIconSecondary: FixedColors.fixedPlayerIconSecondary,
  fixedPlayerBrandPrimary: FixedColors.fixedPlayerBrandPrimary,
  fixedPlayerBrandGradientStart: FixedColors.fixedPlayerBrandGradientStart,
  fixedPlayerBrandGradientEnd: FixedColors.fixedPlayerBrandGradientEnd,
  fixedPlayerBrandSecondary: FixedColors.fixedPlayerBrandSecondary,
  fixedPlayerSemanticInfo: FixedColors.fixedPlayerSemanticInfo,
  fixedPlayerPlayback: FixedColors.fixedPlayerPlayback,
);

extension AppColorsExtension on BuildContext {
  AppColors get colors {
    final brightness = Theme.of(this).brightness;
    switch (brightness) {
      case Brightness.light:
        return colorsLight;
      case Brightness.dark:
        return colorsDark;
      default:
        return colorsLight;
    }
  }
}
