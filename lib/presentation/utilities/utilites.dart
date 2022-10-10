import 'package:flutter/material.dart';

class Utilities {
  Utilities._();

  // iPhone 5, iPod touch 5 - 6 - 7, SE 1
  static bool isSmallestDevice(BuildContext context) {
    return MediaQuery.of(context).size.height <= 568;
  }

  static bool isSmallDevice(BuildContext context) {
    // iPhone 6s screen width
    return MediaQuery.of(context).size.width <= 375;
  }

  static void unFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
