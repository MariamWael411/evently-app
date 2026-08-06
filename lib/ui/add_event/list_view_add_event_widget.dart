import 'package:evently/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../model/model_app.dart';
import '../../providers/theme_provider.dart';
import '../../utils/config.dart';
import '../Primary_screen/tabs/home_tab/tab_item_widget.dart';

class ListViewAddEventWidget extends StatefulWidget {
  ListViewAddEventWidget({super.key});

  @override
  State<ListViewAddEventWidget> createState() => _ListViewAddEventWidgetState();
}

class _ListViewAddEventWidgetState extends State<ListViewAddEventWidget> {
  List<String> titles = [];

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var eventProvider = Provider.of<EventProvider>(context);
    titles = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
    ];
    return Column(
      spacing: Config.height(context) * 0.02,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          height: Config.height(context) * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              width: 2,
            ),
            image: DecorationImage(
              image: AssetImage(
                themeProvider.isDark()
                    ? ModelApp.imagesDark[eventProvider.currentIndex]
                    : ModelApp.imagesLight[eventProvider.currentIndex],
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: Config.height(context) * 0.06,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                eventProvider.changeIndex(index);
                setState(() {});
              },
              child: TabItemWidget(
                isSelected: eventProvider.currentIndex == index,
                icon: eventProvider.currentIndex == index
                    ? ModelApp.selectedIcons[index + 1]
                    : ModelApp.unSelectedIcons[index + 1],
                text: titles[index],
              ),
            ),
            separatorBuilder: (context, index) =>
                SizedBox(width: Config.width(context) * 0.03),
            itemCount: titles.length,
          ),
        ),
      ],
    );
  }
}
