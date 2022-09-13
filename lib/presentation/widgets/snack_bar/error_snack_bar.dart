import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

void showErrorSnackBar({
  required BuildContext context,
  required String errorMessage,
}) {
  if (errorMessage.isNotEmpty) {
    final snackBar = SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      content: ErrorSnackBar(errorMessage: errorMessage),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class ErrorSnackBar extends StatelessWidget {
  const ErrorSnackBar({
    required this.errorMessage,
    Key? key,
  }) : super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * .5;
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      constraints: BoxConstraints(maxHeight: maxHeight),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.colors.error,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: _buildContentItem(context),
          ),
          _buildCloseItem(context),
        ],
      ),
    );
  }

  Widget _buildContentItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 0, 10),
      child: Text(
        errorMessage,
        style: AppTextStyles.textSmall.copyWith(
          color: context.colors.textContrastOnDark,
        ),
      ),
    );
  }

  Widget _buildCloseItem(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
        child: AppIcons.close(
          color: context.colors.textContrastOnDark,
          size: 24,
        ),
      ),
    );
  }
}
