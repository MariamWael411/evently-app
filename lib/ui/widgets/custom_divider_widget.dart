import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../utils/config.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            indent: Config.width(context) * 0.03,
            endIndent: Config.width(context) * 0.03,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        Text(
          AppLocalizations.of(context)!.or,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Expanded(
          child: Divider(
            indent: Config.width(context) * 0.04,
            endIndent: Config.width(context) * 0.02,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ],
    );
  }
}
