import 'package:evently/firebase_utils.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/event.dart';
import 'package:evently/providers/event_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/ui/Primary_screen/tabs/home_tab/custom_list_view.dart';
import 'package:evently/ui/Primary_screen/tabs/home_tab/stream_builder_widget.dart';
import 'package:evently/utils/app_style.dart';
import 'package:evently/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';
import 'package:provider/provider.dart';

import '../../../../providers/language_provider.dart';
import '../../../../providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Event> eventList = [];
  Stream<List<Event>>? stream;
  late var userProvider;
  late EventProvider eventProvider;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      stream = FirebaseUtils.getAllEvent(userProvider: userProvider);
      eventProvider.changeIndex(0);
    });
  }

  void updateEvent(int index) {
    eventProvider.changeIndex(index);
    if (eventProvider.currentIndex == 0) {
      stream = FirebaseUtils.getAllEvent(userProvider: userProvider);
    } else {
      stream = FirebaseUtils.getFilterEvent(
        userProvider: userProvider,
        selectedIndex: index,
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    eventProvider = Provider.of<EventProvider>(context);

    var themeProvider = Provider.of<ThemeProvider>(context);
    userProvider = Provider.of<UserProvider>(context);
    var languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Config.width(context) * 0.03,
            vertical: Config.height(context) * 0.02,
          ),
          child: Column(
            spacing: Config.height(context) * 0.02,
            children: [
              Row(
                spacing: Config.width(context) * 0.03,
                children: [
                  Column(
                    spacing: Config.height(context) * 0.01,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.welcome_back,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),

                      Text(
                        userProvider.myUser!.name,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    themeProvider.isDark() ? Bootstrap.moon : Bootstrap.sun,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Config.width(context) * 0.024,
                      vertical: Config.height(context) * 0.01,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      languageProvider.languageCode.toUpperCase(),
                      style: AppStyle.semBold14White,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Config.height(context) * 0.06,
                child: Padding(
                  padding: EdgeInsets.only(top: Config.height(context) * 0.01),
                  child: CustomListView(onTap: updateEvent),
                ),
              ),

              Expanded(
                child: StreamBuilderWidget(
                  eventList: eventList,
                  stream: stream,
                  text: AppLocalizations.of(context)!.no_event_found_yet,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
