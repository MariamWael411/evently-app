import 'package:evently/ui/introduction_screen/list_view_widget.dart';
import 'package:evently/utils/app_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/theme_provider.dart';
import '../../utils/app_image.dart';
import '../../utils/config.dart';
import '../widgets/custom_leading_widget.dart';

class IntroductionScreen2 extends StatefulWidget {
  IntroductionScreen2({super.key});

  @override
  State<IntroductionScreen2> createState() => _IntroductionScreen2State();
}

class _IntroductionScreen2State extends State<IntroductionScreen2> {
  final PageController pageController = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: (currentIndex == 0)
            ? null
            : CustomLeadingWidget(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Theme
                .of(context)
                .colorScheme
                .primary,
          ),
          onTap: () {
            pageController.previousPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut);
          },
        ),
        backgroundColor: Colors.transparent,
        title: Image.asset(
          themeProvider.isDark() ? AppImage.iconBlack : AppImage.iconLight,
        ),
        centerTitle: true,
        actionsPadding: EdgeInsets.symmetric(
          horizontal: Config.width(context) * 0.04,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(AppRoute.loginScreen);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  width: 2,
                ),
              ),
            ),
            child: Text(
              AppLocalizations.of(context)!.skip,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
      body: Expanded(
        child: PageView.builder(
          onPageChanged: (value) {
            currentIndex = value;
            setState(() {});
          },
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              ListViewWidget(
                controller: pageController,
                index: index,
                next: () {
                  pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                finish: () {
                  Navigator.of(context).pushReplacementNamed(
                      AppRoute.loginScreen);
                },
              ),
          itemCount: 3,
        ),
      ),
    );
  }
}
