import 'package:evently/utils/app_color.dart';
import 'package:evently/utils/app_style.dart';
import 'package:evently/utils/config.dart';
import 'package:flutter/material.dart';

class TabItemWidget extends StatelessWidget {
  TabItemWidget({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.text,
  });

  IconData? icon;
  bool isSelected;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Config.width(context) * 0.03),
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected
              ? Colors.transparent
              : Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
      child: Row(
        spacing: Config.width(context) * 0.03,
        children: [
          Icon(
            icon,
            color: isSelected
                ? AppColor.white
                : Theme.of(context).colorScheme.primary,
          ),
          Text(
            text,
            style: isSelected
                ? AppStyle.med16White
                : Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
