import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/widgets/custom_elevated_button.dart';
import 'package:evently/ui/widgets/custom_text_form_feild.dart';
import 'package:evently/utils/app_route.dart';
import 'package:evently/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';
import '../../utils/app_image.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Config.width(context) * 0.04,
            vertical: Config.height(context) * 0.04,
          ),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: Config.height(context) * 0.02,
              children: [
                Image.asset(
                  themeProvider.isDark()
                      ? AppImage.iconBlack
                      : AppImage.iconLight,
                ),
                Text(
                  AppLocalizations.of(context)!.create_your_account,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                CustomTextFormFeild(
                  hintText: AppLocalizations.of(context)!.enter_your_name,
                  prefixIcon: Icon(Bootstrap.person),
                ),
                CustomTextFormFeild(
                  hintText: AppLocalizations.of(context)!.enter_your_email,
                  prefixIcon: Icon(Bootstrap.envelope),
                ),
                CustomTextFormFeild(
                  hintText: AppLocalizations.of(context)!.enter_your_password,
                  prefixIcon: Icon(Bootstrap.lock),
                  sufixIcon: Icon(Bootstrap.eye_slash),
                ),
                CustomTextFormFeild(
                  hintText: AppLocalizations.of(context)!.confirm_your_password,
                  prefixIcon: Icon(Bootstrap.lock),
                  sufixIcon: Icon(Bootstrap.eye_slash),
                ),
                SizedBox(height: Config.height(context) * 0.003),

                CustomElevatedButton(
                  text: AppLocalizations.of(context)!.sign_up,
                  onClick: () {
                    Navigator.of(context).pushReplacementNamed(
                        AppRoute.primaryScreen);
                  },
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.already_have_an_account,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(AppRoute.loginScreen);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.login,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ],
                ),

                Row(
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
                ),
                SizedBox(height: Config.height(context) * 0.001),

                CustomElevatedButton(
                  onClick: () {},
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  item: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: Config.width(context) * 0.02,
                    children: [
                      Brand(Brands.google),
                      Text(
                        AppLocalizations.of(context)!.sign_up_with_google,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
