import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/language_provider.dart';

typedef onClick = void Function(String?);

class DialogLanguage extends StatefulWidget {
  DialogLanguage({super.key});

  @override
  State<DialogLanguage> createState() => _DialogLanguageState();
}

class _DialogLanguageState extends State<DialogLanguage> {
  late LanguageProvider languageProvider;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context);
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,

      constraints: BoxConstraints(maxHeight: Config.height(context) * 0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          row(AppLocalizations.of(context)!.english, 'en', 0),
          Divider(color: Theme.of(context).colorScheme.onPrimaryContainer),
          row(AppLocalizations.of(context)!.arabic, 'ar', 1),
        ],
      ),
    );
  }

  Padding row(String text, String languageCode, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Config.width(context) * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: Theme.of(context).textTheme.labelSmall),
          Radio(
            value: languageCode,
            groupValue: languageProvider.languageCode,
            activeColor: Theme.of(context).colorScheme.primary,

            onChanged: (value) {
              if (index == 0) {
                languageProvider.changeLanguage('en');
              } else {
                languageProvider.changeLanguage('ar');
              }
            },
          ),
        ],
      ),
    );
  }
}
