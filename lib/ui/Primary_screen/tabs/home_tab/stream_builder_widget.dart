import 'package:evently/ui/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

import '../../../../model/event.dart';
import 'list_view_container.dart';

class StreamBuilderWidget extends StatelessWidget {
  StreamBuilderWidget({
    super.key,
    required this.eventList,
    required this.stream,
    required this.text,
  });

  String text;
  List<Event> eventList;
  Stream<List<Event>>? stream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        } else if (snapshot.hasError) {
          return CustomTextWidget(text: snapshot.error.toString());
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return CustomTextWidget(text: text);
        } else {
          eventList = snapshot.data!;

          return eventList.isEmpty
              ? CustomTextWidget(text: text)
              : ListViewContainer(eventList: eventList);
        }
      },
    );
  }
}
