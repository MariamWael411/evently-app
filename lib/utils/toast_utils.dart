import 'package:evently/utils/app_style.dart';
import 'package:evently/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ToastUtils {
  static void showToastMessage({
    required String message,
    required BuildContext context,
  }) {
    showToastWidget(
      Container(
        padding: EdgeInsets.all(Config.width(context) * 0.02),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
        ),

        child: Text(message, style: AppStyle.semBold16White),
      ),
      context: context,
      animation: StyledToastAnimation.slideFromLeft,
      position: StyledToastPosition.center,
    );
  }
}
