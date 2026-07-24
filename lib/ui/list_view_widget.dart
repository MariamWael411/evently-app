import 'package:evently/ui/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../l10n/app_localizations.dart';
import '../providers/theme_provider.dart';
import '../utils/app_image.dart';
import '../utils/config.dart';

class ListViewWidget extends StatelessWidget {
  ListViewWidget({
    super.key,
    required this.index,
    required this.next,
    required this.finish,
    required this.controller,
  });

  List<String> images = [];
  List<String> titles = [];
  List<String> bodies = [];
  VoidCallback next;
  VoidCallback finish;
  int index;
  PageController controller;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    images = [
      themeProvider.isDark() ? AppImage.intro1Dark : AppImage.intro1Light,
      themeProvider.isDark() ? AppImage.intro2Dark : AppImage.intro2Light,
      themeProvider.isDark() ? AppImage.intro3Dark : AppImage.intro3Light,
    ];
    titles = [
      AppLocalizations.of(context)!.intro2_title,
      AppLocalizations.of(context)!.intro3_title,
      AppLocalizations.of(context)!.intro4_title,
    ];
    bodies = [
      AppLocalizations.of(context)!.intro2_body,
      AppLocalizations.of(context)!.intro3_body,
      AppLocalizations.of(context)!.intro4_body,
    ];
    return Padding(
      padding: EdgeInsets.all(Config.width(context) * 0.04),
      child: Column(
        spacing: Config.height(context) * 0.01,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(images[index]),
          Center(
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,

              effect: ExpandingDotsEffect(
                expansionFactor: 3,
                dotWidth: Config.width(context) * 0.024,
                dotHeight: Config.height(context) * 0.013,
                dotColor: Theme.of(context).colorScheme.onPrimaryFixed,
                activeDotColor: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Text(titles[index], style: Theme.of(context).textTheme.bodyLarge),
          Text(bodies[index], style: Theme.of(context).textTheme.bodyMedium),
          Spacer(),
          CustomElevatedButton(
            text: (index == images.length - 1)
                ? AppLocalizations.of(context)!.lets_start
                : AppLocalizations.of(context)!.next,
            onClick: (index == images.length - 1) ? finish : next,
          ),
          SizedBox(height: Config.height(context) * 0.01),
        ],
      ),
    );
  }
}
