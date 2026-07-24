import 'package:evently/utils/config.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  String text;
  VoidCallback onClick;

  CustomElevatedButton({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.symmetric(vertical: Config.height(context) * 0.017),
      ),
      onPressed: onClick,
      child: Text(text, style: Theme.of(context).textTheme.displaySmall),
    );
  }
}
