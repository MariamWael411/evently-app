import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/Primary_screen/tabs/home_tab/tab_item_widget.dart';
import 'package:evently/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';

class CustomListView extends StatefulWidget {
  CustomListView({super.key, required this.axis});

  Axis axis;

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  List<String> titles = [];

  List<IconData> unSelectedIcons = [
    Bootstrap.grid,
    Bootstrap.bicycle,
    Bootstrap.cake,
    Bootstrap.calendar,
    Bootstrap.book,
    Bootstrap.image,
  ];
  List<IconData> selectedIcons = [
    Bootstrap.grid_3x3_gap_fill,
    Bootstrap.bicycle,
    Bootstrap.cake_fill,
    Bootstrap.calendar_fill,
    Bootstrap.book_fill,
    Bootstrap.image_fill,
  ];

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
      scrollDirection: widget.axis,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          currentIndex = index;
          setState(() {});
        },
        child: TabItemWidget(
          isSelected: currentIndex == index,
          icon: currentIndex == index
              ? selectedIcons[index]
              : unSelectedIcons[index],
          text: titles[index],
        ),
      ),
      separatorBuilder: (context, index) =>
          SizedBox(width: Config.width(context) * 0.03),
      itemCount: titles.length,
    );
  }
}
