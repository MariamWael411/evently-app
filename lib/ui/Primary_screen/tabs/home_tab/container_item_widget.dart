import 'package:evently/utils/app_image.dart';
import 'package:evently/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';
import 'package:provider/provider.dart';

import '../../../../providers/theme_provider.dart';

class ContainerItemWidget extends StatelessWidget {
  const ContainerItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Config.width(context) * 0.02,
        vertical: Config.height(context) * 0.01,
      ),
      height: Config.height(context) * 0.23,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            themeProvider.isDark()
                ? AppImage.birthdayDark
                : AppImage.birthdayLight,
          ),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Config.width(context) * 0.013,
              vertical: Config.height(context) * 0.009,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              border: Border.all(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '21 Jan',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontSize: 16),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Config.width(context) * 0.013,
              vertical: Config.height(context) * 0.009,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              border: Border.all(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'This is a Birthday Party ',
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall!.copyWith(fontSize: 14),
                ),
                Icon(
                  Bootstrap.heart,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
