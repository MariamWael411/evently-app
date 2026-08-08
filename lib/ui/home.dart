import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/ui/widgets/custom_elevated_button.dart';
import 'package:evently/ui/widgets/cutom_flutter_toggle.dart';
import 'package:evently/utils/app_color.dart';
import 'package:evently/utils/app_image.dart';
import 'package:evently/utils/app_route.dart';
import 'package:evently/utils/app_style.dart';
import 'package:evently/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';
import 'package:provider/provider.dart';
class Home extends StatefulWidget {
  Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Config.width(context) * 0.04),
          child: SingleChildScrollView(
            child: Column(
              spacing: Config.height(context) * 0.01,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                    themeProvider.isDark() ? AppImage.iconBlack : AppImage
                        .iconLight),
                Image.asset(
                    themeProvider.isDark() ? AppImage.onBoardingDark : AppImage
                        .onBoardingLight),
                Text(AppLocalizations.of(context)!.intro1_title, style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge,),
                Text(AppLocalizations.of(context)!.intro1_body, style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium,),
                Row(
                  spacing: Config.width(context) * 0.04,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalizations.of(context)!.language, style: Theme
                        .of(context)
                        .textTheme
                        .bodySmall,),
                    CutomFlutterToggle(
                      option1: Text(AppLocalizations.of(context)!.english,
                        style: languageProvider.languageCode == 'en' ? AppStyle
                            .semBold14White : Theme
                            .of(context)
                            .textTheme
                            .displayMedium,),
                      option2: Text(AppLocalizations.of(context)!.arabic,
                          style: languageProvider.languageCode == 'ar'
                              ? AppStyle
                              .semBold14White
                              : Theme
                              .of(context)
                              .textTheme
                              .displayMedium),
                      OnClick: (index) {
                        if (index == 0) {
                          languageProvider.changeLanguage('en');
                        } else {
                          languageProvider.changeLanguage('ar');
                        }
                      },
                    ),
                  ],
                ),
                Row(
                  spacing: Config.width(context) * 0.241,
                  children: [
                    Text(AppLocalizations.of(context)!.theme, style: Theme
                        .of(context)
                        .textTheme
                        .bodySmall,),
                    Expanded(
                      child: CutomFlutterToggle(
                          option1: themeProvider.isDark() ? Icon(
                            Bootstrap.sun, color: Theme
                              .of(context)
                              .colorScheme
                              .inversePrimary,) : Icon(
                            Bootstrap.sun_fill, color: AppColor.white,),
                          option2: themeProvider.isDark() ? Icon(
                            Bootstrap.moon_fill, color: AppColor.white,) : Icon(
                            Bootstrap.moon, color: Theme
                              .of(context)
                              .colorScheme
                              .inversePrimary,),
                          OnClick: (index) {
                            if (index == 0) {
                              themeProvider.changeThemeToDark(ThemeMode.light);
                            } else {
                              themeProvider.changeThemeToDark(ThemeMode.dark);
                            }
                          }
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Config.height(context) * 0.01,
                ),
                CustomElevatedButton(
                  text: AppLocalizations.of(context)!.lets_start,
                  onClick: () {
                    Navigator.of(context).pushReplacementNamed(
                        AppRoute.introScreen);
                  },

                ),
                SizedBox(
                  height: Config.height(context) * 0.01,
                ),

              ],

            ),
          ),
        ),
      ),
    );
  }
}
