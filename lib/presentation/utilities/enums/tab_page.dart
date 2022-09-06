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
        return 'Home';
      case TabPage.favorite:
        return 'Favorite';
      case TabPage.chat:
        return 'Chat';
      case TabPage.myPage:
        return 'My Page';
    }
  }

  IconData icon(
    BuildContext context, {
    required double size,
    bool isSelected = false,
  }) {
    switch (this) {
      case TabPage.home:
        return Icons.home;
      case TabPage.favorite:
        return Icons.favorite;
      case TabPage.chat:
        return Icons.chat;
      case TabPage.myPage:
        return Icons.person;
    }
  }
}
