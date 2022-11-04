import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/utilities/utilites.dart';
import 'package:batru_house_rental/presentation/widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';

Future<void> showAppDialog(
  BuildContext context, {
  required String title,
  required String content,
}) async {
  await Utilities.showDialogWithBackgroundDecoration(
      context,
      AppDialogView(
        title: title,
        content: content,
      ));
}

class AppDialogView extends StatelessWidget {
  const AppDialogView({
    required this.title,
    required this.content,
    Key? key,
  }) : super(key: key);
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 24,
        children: [
          Text(
            title,
            style: AppTextStyles.headingSmall.copyWith(
              color: context.colors.textPrimary,
            ),
          ),
          Text(content,
              style: AppTextStyles.textMedium.copyWith(
                color: context.colors.textPrimary,
              )),
          AppButton(
            isExpanded: true,
            title: 'Ok',
            onButtonTap: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
