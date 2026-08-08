import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/cupertino.dart';

import '../l10n/app_localizations.dart';
import '../utils/app_image.dart';

class IntroductionModel {
  String image;
  String title;
  String body;

  IntroductionModel({
    required this.image,
    required this.title,
    required this.body,
  });

  static List<IntroductionModel> getIntroModel({
    required BuildContext context,
    required ThemeProvider themeProvider,
  }) {
    return [
      IntroductionModel(
        image: themeProvider.isDark()
            ? AppImage.intro1Dark
            : AppImage.intro1Light,
        title: AppLocalizations.of(context)!.intro2_title,
        body: AppLocalizations.of(context)!.intro2_body,
      ),
      IntroductionModel(
        image: themeProvider.isDark()
            ? AppImage.intro2Dark
            : AppImage.intro2Light,
        title: AppLocalizations.of(context)!.intro3_title,
        body: AppLocalizations.of(context)!.intro3_body,
      ),
      IntroductionModel(
        image: themeProvider.isDark()
            ? AppImage.intro3Dark
            : AppImage.intro3Light,
        title: AppLocalizations.of(context)!.intro4_title,
        body: AppLocalizations.of(context)!.intro4_body,
      ),
    ];
  }
}
