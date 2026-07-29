import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/Primary_screen/tabs/home_tab/custom_list_view.dart';
import 'package:evently/ui/Primary_screen/tabs/home_tab/list_view_container.dart';
import 'package:evently/utils/app_style.dart';
import 'package:evently/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';
import 'package:provider/provider.dart';

import '../../../../providers/language_provider.dart';
import '../../../../providers/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Config.width(context) * 0.03,
            vertical: Config.height(context) * 0.02,
          ),
          child: Column(
            spacing: Config.height(context) * 0.02,
            children: [
              Row(
                spacing: Config.width(context) * 0.03,
                children: [
                  Column(
                    spacing: Config.height(context) * 0.01,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.welcome_back,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),

                      Text(
                        'John Safwat',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    themeProvider.isDark() ? Bootstrap.moon : Bootstrap.sun,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Config.width(context) * 0.024,
                      vertical: Config.height(context) * 0.01,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      languageProvider.languageCode.toUpperCase(),
                      style: AppStyle.semBold14White,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Config.height(context) * 0.06,
                child: CustomListView(),
              ),

              Expanded(
                child: ListViewContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
