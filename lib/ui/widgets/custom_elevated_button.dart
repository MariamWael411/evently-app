import 'package:evently/utils/app_style.dart';
import 'package:evently/utils/config.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  String? text;
  VoidCallback onClick;
  Widget? item;
  Color? backgroundColor;

  CustomElevatedButton(
      {super.key, this.backgroundColor, this.text, required this.onClick, this.item});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: (backgroundColor == null) ? Theme
              .of(context)
              .colorScheme
              .primary : backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.symmetric(vertical: Config.height(context) * 0.017),
          side: BorderSide(
              color: Theme
                  .of(context)
                  .colorScheme
                  .onPrimaryContainer,
              width: 2
          )
      ),
      onPressed: onClick,
      child: (item == null) ? Text(text!, style: AppStyle.med20White) : item,
    );
  }
}
