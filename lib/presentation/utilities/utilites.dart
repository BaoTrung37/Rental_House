import 'package:flutter/material.dart';

class Utilities {
  Utilities._();
  static void unFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
