import 'package:evently/utils/config.dart';
import 'package:flutter/material.dart';

class UtilsDialog {
  static void showLoading({
    required BuildContext context,
    required String content,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
          content: Row(
            spacing: Config.width(context) * 0.03,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
              Text(content, style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
        );
      },
    );
  }

  static void hideDialog({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String content,
    required String title,
    String? posAction,
    VoidCallback? posActions,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        List<Widget> actions = [];
        if (posAction != null) {
          actions.add(
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                posActions?.call();
              },
              child: Text(
                posAction,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          );
        }
        return AlertDialog(
          content: Text(
            content,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          title: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontSize: 16),
          ),
          actions: actions,
        );
      },
    );
  }
}
