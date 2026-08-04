import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';
import 'package:intl/intl.dart';

import '../../utils/config.dart';

class TimeContainerWidget extends StatelessWidget {
  TimeContainerWidget({super.key, required this.date});

  DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration(
        context,
        Theme.of(context).colorScheme.onPrimary,
        16,
      ),
      child: Row(
        spacing: Config.width(context) * 0.04,
        children: [
          Container(
            decoration: boxDecoration(
              context,
              Theme.of(context).colorScheme.onSecondaryContainer,
              8,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: Config.width(context) * 0.02,
              vertical: Config.height(context) * 0.01,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: Config.width(context) * 0.02,
              vertical: Config.height(context) * 0.012,
            ),

            child: Icon(
              Iconsax.calendar_1_outline,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Column(
            spacing: Config.height(context) * 0.01,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat('dd MMM').format(date).toString(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                DateFormat('hh:mm a').format(date).toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }

  BoxDecoration boxDecoration(
    BuildContext context,
    Color color,
    double borderRadis,
  ) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(borderRadis),
      border: Border.all(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        width: 1,
      ),
    );
  }
}
