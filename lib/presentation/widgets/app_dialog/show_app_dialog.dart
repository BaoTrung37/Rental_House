import 'dart:io';

import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool?> showAppDialog(
  BuildContext context, {
  String? title,
  String? content,
  List<ActionAppDialog>? actions,
  Widget? child,
}) {
  if (Platform.isIOS) {
    return showCupertinoDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AppDialog(
          title: title,
          content: content,
          actions: actions,
          child: child,
        );
      },
    );
  } else {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AppDialog(
          title: title,
          content: content,
          actions: actions,
          child: child,
        );
      },
    );
  }
}

class AppDialog extends StatelessWidget {
  const AppDialog({
    Key? key,
    this.title,
    this.content,
    this.actions,
    this.child,
  }) : super(key: key);
  final String? title;
  final String? content;
  final List<ActionAppDialog>? actions;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return _buildCupertinoDialog(context);
    } else {
      return _buildMaterialDialog(context);
    }
  }

  AlertDialog _buildMaterialDialog(BuildContext context) {
    return AlertDialog(
      title: _buildTitle(),
      content: child ?? _buildContent(),
      actions: actions!
          .map(
            (e) => TextButton(
              onPressed: () {
                e.onAction.call(context);
              },
              child: Text(
                e.actionDialogTitle,
                style: e.isDefaultAction
                    ? AppTextStyles.labelMedium
                    : AppTextStyles.labelMediumLight,
              ),
            ),
          )
          .toList(),
    );
  }

  CupertinoAlertDialog _buildCupertinoDialog(BuildContext context) {
    return CupertinoAlertDialog(
      title: _buildTitle(),
      content: child ?? _buildContent(),
      actions: actions!
          .map(
            (e) => CupertinoDialogAction(
              isDefaultAction: e.isDefaultAction,
              onPressed: () {
                e.onAction.call(context);
              },
              child: SizedBox(
                width: e.isCupertinoExpandedDialogAction ? 270 : null,
                child: Text(
                  e.actionDialogTitle,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget? _buildTitle() {
    return title != null ? Text(title!) : null;
  }

  Widget? _buildContent() {
    return content != null ? Text(content!) : null;
  }
}

class ActionAppDialog {
  ActionAppDialog({
    required this.actionDialogTitle,
    required this.onAction,
    this.isDefaultAction = false,
    this.isCupertinoExpandedDialogAction = false,
  });

  final String actionDialogTitle;
  final Function(BuildContext) onAction;
  final bool isDefaultAction;
  final bool isCupertinoExpandedDialogAction;
}
