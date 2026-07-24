import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/ui/custom_elevated_button.dart';
import 'package:evently/utils/app_color.dart';
import 'package:evently/utils/app_image.dart';
import 'package:evently/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_button/flutter_toggle_button.dart';
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
    Icon option1 = Icon(Bootstrap.sun_fill, color: AppColor.white,);
    Icon option2 = Icon(Bootstrap.moon, color: Theme
        .of(context)
        .colorScheme
        .inversePrimary,);
    var themeProvider = Provider.of<ThemeProvider>(context);
    var languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Config.width(context) * 0.04),
          child: Column(
            spacing: Config.height(context) * 0.01,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(themeProvider.isDark() ? AppImage.iconBlack : AppImage
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
                  FlutterToggleButton(
                    buttonTextFontSize: 14,
                    enableTextFontWeight: FontWeight.w600,
                    buttonColor: Theme
                        .of(context)
                        .colorScheme
                        .primary,
                    outerContainerColor: Colors.transparent,
                    buttonWidth: Config.width(context) * 0.23,
                    borderRadius: 10,
                    buttonBorderColor: Theme
                        .of(context)
                        .colorScheme
                        .primary,
                    disableTextColor: Theme
                        .of(context)
                        .colorScheme
                        .inversePrimary,
                    buttonHeight: Config.width(context) * 0.12,

                    items: [
                      AppLocalizations.of(context)!.english,
                      AppLocalizations.of(context)!.arabic
                    ],
                    onTap: (index) {
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
                  FlutterToggleButton(

                    buttonColor: Theme
                        .of(context)
                        .colorScheme
                        .primary,
                    outerContainerColor: Colors.transparent,
                    buttonWidth: Config.width(context) * 0.23,
                    borderRadius: 10,
                    buttonHeight: Config.width(context) * 0.12,
                    items: [
                      themeProvider.isDark() ? Icon(Bootstrap.sun, color: Theme
                          .of(context)
                          .colorScheme
                          .inversePrimary,) : Icon(
                        Bootstrap.sun_fill, color: AppColor.white,),
                      themeProvider.isDark() ? Icon(
                        Bootstrap.moon_fill, color: AppColor.white,) : Icon(
                        Bootstrap.moon, color: Theme
                          .of(context)
                          .colorScheme
                          .inversePrimary,)
                    ],
                    onTap: (index) {
                      if (index == 0) {
                        themeProvider.changeThemeToDark(ThemeMode.light);
                      } else {
                        themeProvider.changeThemeToDark(ThemeMode.dark);
                      }
                    },

                  )
                ],
              ),
              CustomElevatedButton(
                  text: AppLocalizations.of(context)!.lets_start),
            ],

          ),
        ),
      ),
    );
  }
}
