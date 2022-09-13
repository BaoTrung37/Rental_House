import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

void showInfoSnackBar({
  required BuildContext context,
  required String notifyMessage,
}) {
  final snackBar = SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(0),
    padding: const EdgeInsets.all(0),
    content: _buildInfoSnackBar(
      context,
      message: notifyMessage,
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

// Use build function instead of widget
// because in widget build, `Theme.of(context).brightness` is `dark`.
Widget _buildInfoSnackBar(
  BuildContext context, {
  required String message,
}) {
  return Container(
    margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: context.colors.backgroundContrast,
    ),
    child: ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 36),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          child: Text(
            message,
            style: AppTextStyles.textSmall.copyWith(
              color: context.colors.textContrastOnContrastBackground,
            ),
          ),
        ),
      ),
    ),
  );
}
