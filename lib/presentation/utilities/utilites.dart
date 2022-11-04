import 'package:batru_house_rental/presentation/resources/resources.dart';
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
