import 'package:evently/model/introduction_model.dart';
import 'package:evently/ui/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/theme_provider.dart';
import '../../utils/config.dart';

class ListViewWidget extends StatelessWidget {
  ListViewWidget({
    super.key,
    required this.index,
    required this.next,
    required this.finish,
    required this.controller,
  });

  VoidCallback next;
  VoidCallback finish;
  int index;
  PageController controller;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);


    List<IntroductionModel> introModel = IntroductionModel.getIntroModel(
        context: context, themeProvider: themeProvider);
    return Padding(
      padding: EdgeInsets.all(Config.width(context) * 0.04),
      child: Column(
        spacing: Config.height(context) * 0.01,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(introModel[index].image),
          Center(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),

              child: SmoothPageIndicator(
                controller: controller,
                count: 3,

                effect: ExpandingDotsEffect(
                  expansionFactor: 3,
                  offset: 4,
                  dotWidth: Config.width(context) * 0.024,
                  dotHeight: Config.height(context) * 0.01,
                  dotColor: Theme.of(context).colorScheme.onPrimaryFixed,
                  activeDotColor: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          Text(introModel[index].title, style: Theme
              .of(context)
              .textTheme
              .bodyLarge),
          Text(introModel[index].body, style: Theme
              .of(context)
              .textTheme
              .bodyMedium),
          Spacer(),
          CustomElevatedButton(
            text: (index == introModel.length - 1)
                ? AppLocalizations.of(context)!.lets_start
                : AppLocalizations.of(context)!.next,
            onClick: (index == introModel.length - 1) ? finish : next,
          ),
          SizedBox(height: Config.height(context) * 0.01),
        ],
      ),
    );
  }
}
