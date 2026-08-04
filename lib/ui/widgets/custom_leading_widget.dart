import 'package:flutter/material.dart';

import '../../utils/config.dart';

class CustomLeadingWidget extends StatelessWidget {
  CustomLeadingWidget({super.key, required this.icon, required this.onTap});

  Widget icon;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Config.width(context) * 0.03,
        top: Config.height(context) * 0.01,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          width: 1,
        ),
      ),
      child: IconButton(onPressed: onTap, icon: icon),
    );
  }
}
