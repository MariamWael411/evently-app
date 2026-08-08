import 'package:evently/providers/event_home_provider.dart';
import 'package:evently/ui/Primary_screen/tabs/home_tab/tab_item_widget.dart';
import 'package:evently/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/model_app.dart';

typedef OnTap = void Function(int);

class CustomListView extends StatefulWidget {
  CustomListView({super.key, required this.onTap});

  OnTap onTap;

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  late EventHomeProvider eventProvider;

  @override
  Widget build(BuildContext context) {
    eventProvider = Provider.of<EventHomeProvider>(context);
    List<String> titles = ModelApp.getHomeTitles(context);
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          widget.onTap(index);
          setState(() {});
        },
        child: TabItemWidget(
          isSelected: eventProvider.homeIndex == index,
          icon: eventProvider.homeIndex == index
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
