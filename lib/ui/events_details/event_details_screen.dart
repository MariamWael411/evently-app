import 'package:evently/firebase_utils.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/ui/events_details/time_container_widget.dart';
import 'package:evently/ui/widgets/custom_leading_widget.dart';
import 'package:evently/utils/app_color.dart';
import 'package:evently/utils/app_route.dart';
import 'package:evently/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';
import 'package:provider/provider.dart';

import '../../model/event.dart';
import '../../utils/config.dart';

class EventDetailsScreen extends StatelessWidget {
  EventDetailsScreen({super.key});

  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    themeProvider = Provider.of<ThemeProvider>(context);
    Event? args = ModalRoute
        .of(context)
        ?.settings
        .arguments as Event?;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.transparent,
        leading: CustomLeadingWidget(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).colorScheme.primary,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppLocalizations.of(context)!.event_details,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        centerTitle: true,
        actionsPadding: EdgeInsets.symmetric(
          horizontal: Config.width(context) * 0.03,
        ),
        actions: [
          CustomLeadingWidget(
            icon: Icon(
              EvaIcons.edit_2_outline,
              color: Theme.of(context).colorScheme.primary,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                  AppRoute.updateEventScreen, arguments: args);
            },
          ),
          CustomLeadingWidget(
            icon: Icon(Bootstrap.trash, color: AppColor.red),
            onTap: () {
              FirebaseUtils.deleteEvent(
                  id: args!.id, userId: userProvider.myUser!.id).then((value) {
                Navigator.pop(context);
                ToastUtils.showToastMessage(
                    message: AppLocalizations.of(context)!
                        .event_deleted_successfully,
                    context: context,
                    color: AppColor.red);
              }).catchError((error) {
                ToastUtils.showToastMessage(
                    message: error.toString(), context: context);
              })
              ;
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Config.width(context) * 0.05,
          vertical: Config.height(context) * 0.03,
        ),
        child: Column(
          spacing: Config.height(context) * 0.02,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: Config.height(context) * 0.25,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  width: 1,
                ),
                image: DecorationImage(
                  image: AssetImage(args!.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(args.title, style: Theme.of(context).textTheme.labelSmall),
            TimeContainerWidget(date: args.date),
            Text(
              AppLocalizations.of(context)!.description,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Container(
              height: Config.height(context) * 0.2,
              padding: EdgeInsets.symmetric(
                horizontal: Config.width(context) * 0.04,
                vertical: Config.height(context) * 0.02,
              ),
              decoration: boxDecoration(
                context,
                Theme.of(context).colorScheme.onPrimary,
                16,
              ),
              child: Expanded(
                child: Text(
                  args.description,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: themeProvider.isDark()
                        ? AppColor.lightGrey
                        : AppColor.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration boxDecoration(
    BuildContext context,
    Color color,
    double borderRadis,
  ) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(borderRadis),
      border: Border.all(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        width: 1,
      ),
    );
  }
}
