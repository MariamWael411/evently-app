import 'package:flutter/material.dart';
import 'package:flutter_toggle_button/flutter_toggle_button.dart';

import '../../utils/config.dart';

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
      buttonColor: Theme.of(context).colorScheme.primary,
      outerContainerColor: Colors.transparent,
      buttonWidth: Config.width(context) * 0.23,
      borderRadius: 10,
      buttonHeight: Config.width(context) * 0.12,
      items: [option1, option2],
      onTap: OnClick,
    );
  }
}
/* FlutterToggleButton(

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

                  )*/
/*                  FlutterToggleButton(
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
*/

/*   buttonTextFontSize: 14,
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
                    buttonHeight: Config.width(context) * 0.12,*/

/*  buttonColor: Theme
                        .of(context)
                        .colorScheme
                        .primary,
                    outerContainerColor: Colors.transparent,
                    buttonWidth: Config.width(context) * 0.23,
                    borderRadius: 10,
                    buttonHeight: Config.width(context) * 0.12,*/