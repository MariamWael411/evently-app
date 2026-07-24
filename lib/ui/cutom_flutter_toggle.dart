import 'package:flutter/material.dart';
import 'package:flutter_toggle_button/flutter_toggle_button.dart';

import '../utils/config.dart';

typedef onClick = void Function(int);

class CutomFlutterToggle extends StatelessWidget {
  Widget option1;
  Widget option2;
  onClick OnClick;

  CutomFlutterToggle({
    super.key,
    required this.option1,
    required this.option2,
    required this.OnClick,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterToggleButton(
      buttonTextFontSize: 14,
      enableTextFontWeight: FontWeight.w600,
      buttonColor: Theme.of(context).colorScheme.primary,
      outerContainerColor: Colors.transparent,
      buttonWidth: Config.width(context) * 0.23,
      borderRadius: 10,
      buttonBorderColor: Theme.of(context).colorScheme.primary,
      disableTextColor: Theme.of(context).colorScheme.inversePrimary,
      buttonHeight: Config.width(context) * 0.12,

      items: [option1, option2],
      onTap: (p0) => OnClick,
    );
  }
}
