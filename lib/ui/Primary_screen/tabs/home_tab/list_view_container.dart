import 'package:flutter/material.dart';

import '../../../../utils/config.dart';
import 'container_item_widget.dart';

class ListViewContainer extends StatelessWidget {
  const ListViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => ContainerItemWidget(),
      separatorBuilder: (context, index) =>
          SizedBox(height: Config.height(context) * 0.02),
      itemCount: 20,
    );
  }
}
