import 'package:evently/model/event.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/config.dart';
import 'container_item_widget.dart';

class ListViewContainer extends StatelessWidget {
  ListViewContainer({super.key, required this.eventList});

  List<Event> eventList;

  late UserProvider userProvider;

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return ListView.separated(
      itemBuilder: (context, index) =>
          ContainerItemWidget(eventList: eventList, index: index,),
      separatorBuilder: (context, index) =>
          SizedBox(height: Config.height(context) * 0.02),
      itemCount: eventList.length,
    );
  }

}
