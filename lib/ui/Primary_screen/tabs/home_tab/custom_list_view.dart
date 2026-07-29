import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/Primary_screen/tabs/home_tab/tab_item_widget.dart';
import 'package:evently/utils/config.dart';
import 'package:flutter/material.dart';

import '../../../../model/model_app.dart';

class CustomListView extends StatefulWidget {
  CustomListView({super.key,});



  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  List<String> titles = [];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    titles = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
    ];

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          currentIndex = index;
          setState(() {});
        },
        child: TabItemWidget(
          isSelected: currentIndex == index,
          icon: currentIndex == index
              ? ModelApp.selectedIcons[index]
              : ModelApp.unSelectedIcons[index],
          text: titles[index],
        ),
      ),
      separatorBuilder: (context, index) =>
          SizedBox(width: Config.width(context) * 0.03),
      itemCount: titles.length,
    );
  }
}
