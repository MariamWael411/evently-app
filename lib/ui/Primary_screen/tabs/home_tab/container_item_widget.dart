import 'package:evently/firebase_utils.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/event.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/utils/config.dart';
import 'package:evently/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../providers/theme_provider.dart';

class ContainerItemWidget extends StatelessWidget {
  ContainerItemWidget({
    super.key,
    required this.eventList,
    required this.index,
  });

  List<Event> eventList;
  int index;
  late UserProvider userProvider;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    userProvider = Provider.of<UserProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Config.width(context) * 0.01),
      padding: EdgeInsets.symmetric(
        horizontal: Config.width(context) * 0.02,
        vertical: Config.height(context) * 0.01,
      ),
      height: Config.height(context) * 0.23,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(eventList[index].image),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Config.width(context) * 0.013,
              vertical: Config.height(context) * 0.009,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              border: Border.all(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              DateFormat('dd MMM').format(eventList[index].date).toString(),
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontSize: 16),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Config.width(context) * 0.013,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              border: Border.all(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    eventList[index].title,
                    style: Theme
                        .of(
                      context,
                    )
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 14),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    FirebaseUtils.updateEvent(
                      event: eventList[index],
                      userId: userProvider.myUser?.id ?? '',
                    )
                        .then((value) {
                      ToastUtils.showToastMessage(message: AppLocalizations.of(
                          context)!.event_udate_successfully, context: context);
                    })
                        .catchError((error) {
                      ToastUtils.showToastMessage(
                          message: error.toString(), context: context);
                    })
                    ;
                  },
                  icon: Icon(
                    eventList[index].isFavorite
                        ? Bootstrap.heart_fill
                        : Bootstrap.heart,
                    color: Theme
                        .of(context)
                        .colorScheme
                        .primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
