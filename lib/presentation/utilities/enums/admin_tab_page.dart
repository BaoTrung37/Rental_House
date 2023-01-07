import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

enum AdminTabPage {
  post,
  report,
  chat,
  myPage,
}

extension TabPageExtension on AdminTabPage {
  String get title {
    switch (this) {
      case AdminTabPage.post:
        return 'Duyệt bài';
      case AdminTabPage.report:
        return 'Báo cáo';
      case AdminTabPage.chat:
        return 'Tin nhắn';
      case AdminTabPage.myPage:
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
      case AdminTabPage.post:
        return AppIcons.post(
          size: size,
          color: color,
        );
      case AdminTabPage.report:
        return AppIcons.report(
          size: size,
          color: color,
        );
      case AdminTabPage.chat:
        return AppIcons.message(
          size: size,
          color: color,
        );
      case AdminTabPage.myPage:
        return AppIcons.myPage(
          size: size,
          color: color,
        );
    }
  }
}
