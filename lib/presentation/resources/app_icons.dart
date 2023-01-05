import 'package:batru_house_rental/presentation/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

class AppIcons {
  AppIcons._private();

  static const _iconsPath = 'assets/icons';

  static Widget loading({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Action=Loading.svg',
      color: color,
      size: size,
    );
  }

  static Widget favorite({
    Color? color,
    double? size,
  }) {
    return Icon(
      Icons.favorite_outlined,
      color: color,
      size: size,
    );
  }

  static Widget message({
    Color? color,
    double? size,
  }) {
    return Icon(
      Icons.messenger_rounded,
      color: color,
      size: size,
    );
  }

  static Widget pause({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Action=Pause.svg',
      color: color,
      size: size,
    );
  }

  static Widget play({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Action=Play.svg',
      color: color,
      size: size,
    );
  }

  static Widget replay({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Action=Replay.svg',
      color: color,
      size: size,
    );
  }

  static Widget add({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Add.svg',
      color: color,
      size: size,
    );
  }

  static Widget arrowDown({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Arrow Down.svg',
      color: color,
      size: size,
    );
  }

  static Widget arrowLeft({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Arrow Left.svg',
      color: color,
      size: size,
    );
  }

  static Widget arrowRight({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Arrow Right.svg',
      color: color,
      size: size,
    );
  }

  static Widget article({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Article.svg',
      color: color,
      size: size,
    );
  }

  static Widget autoplayOn({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Article.svg',
      color: color,
      size: size,
    );
  }

  static Widget autoplayOff({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Article.svg',
      color: color,
      size: size,
    );
  }

  static Widget back({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Back.svg',
      color: color,
      size: size,
    );
  }

  static Widget backwardSeek({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Backward Seek.svg',
      color: color,
      size: size,
    );
  }

  static Widget browser({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Browser.svg',
      color: color,
      size: size,
    );
  }

  static Widget check({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Check.svg',
      color: color,
      size: size,
    );
  }

  static Widget chevronDown({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Chevron Down.svg',
      color: color,
      size: size,
    );
  }

  static Widget chevronLeft({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Chevron Left.svg',
      color: color,
      size: size,
    );
  }

  static Widget chevronRight({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Chevron Right.svg',
      color: color,
      size: size,
    );
  }

  static Widget chevronUp({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Chevron Up.svg',
      color: color,
      size: size,
    );
  }

  static Widget clear({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Clear.svg',
      color: color,
      size: size,
    );
  }

  static Widget close({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Close.svg',
      color: color,
      size: size,
    );
  }

  static Widget commentModalOff({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Comment Modal=Off.svg',
      color: color,
      size: size,
    );
  }

  static Widget commentModalOn({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Comment Modal=On.svg',
      color: color,
      size: size,
    );
  }

  static Widget commentOff({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Comment=Off.svg',
      color: color,
      size: size,
    );
  }

  static Widget commentOn({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Comment=On.svg',
      color: color,
      size: size,
    );
  }

  static Widget copy({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Copy.svg',
      color: color,
      size: size,
    );
  }

  static Widget down({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Down.svg',
      color: color,
      size: size,
    );
  }

  static Widget download({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Download Status=Download.svg',
      color: color,
      size: size,
    );
  }

  static Widget downloadFailure({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Download Status=Failure.svg',
      color: color,
      size: size,
    );
  }

  static Widget downloadSuccess({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Download Status=Success.svg',
      color: color,
      size: size,
    );
  }

  static Widget entry({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Entry.svg',
      color: color,
      size: size,
    );
  }

  static Widget expand({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Expand.svg',
      color: color,
      size: size,
    );
  }

  static Widget facebook({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Facebook.svg',
      color: color,
      size: size,
    );
  }

  static Widget flag({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Flag.svg',
      color: color,
      size: size,
    );
  }

  static Widget forwardSeek({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Forward Seek.svg',
      color: color,
      size: size,
    );
  }

  static Widget fullscreenOff({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Fullscreen=Off.svg',
      color: color,
      size: size,
    );
  }

  static Widget fullscreenOn({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Fullscreen=On.svg',
      color: color,
      size: size,
    );
  }

  static Widget gift({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Gift.svg',
      color: color,
      size: size,
    );
  }

  static Widget group({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Group.svg',
      color: color,
      size: size,
    );
  }

  static Widget hashtag({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Hashtag.svg',
      color: color,
      size: size,
    );
  }

  static Widget help({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Help.svg',
      color: color,
      size: size,
    );
  }

  static Widget home({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Home.svg',
      color: color,
      size: size,
    );
  }

  static Widget image({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Image.svg',
      color: color,
      size: size,
    );
  }

  static Widget information({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Infomation.svg',
      color: color,
      size: size,
    );
  }

  static Widget instagram({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Instagram.svg',
      color: color,
      size: size,
    );
  }

  static Widget library({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Library.svg',
      color: color,
      size: size,
    );
  }

  static Widget line({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Line.svg',
      color: color,
      size: size,
    );
  }

  static Widget live({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Live.svg',
      color: color,
      size: size,
    );
  }

  static Widget membership({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Membership.svg',
      color: color,
      size: size,
    );
  }

  static Widget menuSidePanel({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Menu Side Panel.svg',
      color: color,
      size: size,
    );
  }

  static Widget minimize({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Minimize.svg',
      color: color,
      size: size,
    );
  }

  static Widget miniPlayer({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Miniplayer.svg',
      color: color,
      size: size,
    );
  }

  static Widget more({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/More.svg',
      color: color,
      size: size,
    );
  }

  static Widget myPage({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/My Page.svg',
      color: color,
      size: size,
    );
  }

  static Widget notifications({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Notifications.svg',
      color: color,
      size: size,
    );
  }

  static Widget openInNew({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Open in New.svg',
      color: color,
      size: size,
    );
  }

  static Widget pin({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Pin.svg',
      color: color,
      size: size,
    );
  }

  static Widget poll({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Poll.svg',
      color: color,
      size: size,
    );
  }

  static Widget recommended({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Recommended.svg',
      color: color,
      size: size,
    );
  }

  static Widget refresh({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Refresh.svg',
      color: color,
      size: size,
    );
  }

  static Widget retry({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Retry.svg',
      color: color,
      size: size,
    );
  }

  static Widget search({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Search.svg',
      color: color,
      size: size,
    );
  }

  static Widget send({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Send.svg',
      color: color,
      size: size,
    );
  }

  static Widget settings({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Settings.svg',
      color: color,
      size: size,
    );
  }

  static Widget share({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Share.svg',
      color: color,
      size: size,
    );
  }

  static Widget skipNext({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Skip Next.svg',
      color: color,
      size: size,
    );
  }

  static Widget skipPrevious({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Skip Previous.svg',
      color: color,
      size: size,
    );
  }

  static Widget sort({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Sort.svg',
      color: color,
      size: size,
    );
  }

  static Widget filter({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/filter.svg',
      color: color,
      size: size,
    );
  }

  static Widget spotify({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Spotify.svg',
      color: color,
      size: size,
    );
  }

  static Widget tiktok({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Tiktok.svg',
      color: color,
      size: size,
    );
  }

  static Widget time({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Time.svg',
      color: color,
      size: size,
    );
  }

  static Widget trending({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Trending.svg',
      color: color,
      size: size,
    );
  }

  static Widget twitter({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Twitter.svg',
      color: color,
      size: size,
    );
  }

  static Widget up({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Up.svg',
      color: color,
      size: size,
    );
  }

  static Widget video({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Video.svg',
      color: color,
      size: size,
    );
  }

  static Widget youtube({
    Color? color,
    double? size,
  }) {
    return SvgIcon.from(
      '$_iconsPath/Youtube.svg',
      color: color,
      size: size,
    );
  }
}
