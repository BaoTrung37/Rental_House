import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

class Utilities {
  Utilities._();
  static void unFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static Future<void> showDialogWithBackgroundDecoration(
      BuildContext context, Widget widget) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: context.colors.backdropPrimary,
      builder: (dialogContext) {
        return ScaffoldMessenger(
          child: Builder(
            builder: (context) => Scaffold(
              backgroundColor: Colors.transparent,
              body: Dialog(
                backgroundColor: context.colors.surface,
                insetPadding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
                child: widget,
              ),
            ),
          ),
        );
      },
    );
  }
}
