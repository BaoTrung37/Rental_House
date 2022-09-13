import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

enum TabPage {
  home,
  favorite,
  chat,
  myPage,
}

extension TabPageExtension on TabPage {
  String get title {
    switch (this) {
      case TabPage.home:
        return 'Trang chủ';
      case TabPage.favorite:
        return 'Yêu thích';
      case TabPage.chat:
        return 'Tin nhắn';
      case TabPage.myPage:
        return 'Cá nhân';
    }
  }

  Widget icon(
    BuildContext context, {
    required double size,
    bool isSelected = false,
  }) {
    final color =
        isSelected ? context.colors.primaryMain : context.colors.iconPrimary;
    switch (this) {
      case TabPage.home:
        return AppIcons.home(
          size: size,
          color: color,
        );
      case TabPage.favorite:
        return AppIcons.favorite(
          size: size,
          color: color,
        );
      case TabPage.chat:
        return AppIcons.message(
          size: size,
          color: color,
        );
      case TabPage.myPage:
        return AppIcons.myPage(
          size: size,
          color: color,
        );
    }
  }
}
