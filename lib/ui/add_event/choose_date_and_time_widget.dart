import 'package:evently/utils/config.dart';
import 'package:flutter/material.dart';

class ChooseDateAndTimeWidget extends StatelessWidget {
  ChooseDateAndTimeWidget({
    super.key,
    required this.iconData,
    required this.eventData,
    required this.chooseData,
    required this.onClick,
  });

  IconData iconData;
  String chooseData;
  String eventData;
  VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: Config.width(context) * 0.03,
      children: [
        Icon(iconData, color: Theme.of(context).colorScheme.primary),
        Text(eventData, style: Theme.of(context).textTheme.titleLarge),
        Spacer(),
        TextButton(
          onPressed: onClick,
          child: Text(
            chooseData,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ],
    );
  }
}
