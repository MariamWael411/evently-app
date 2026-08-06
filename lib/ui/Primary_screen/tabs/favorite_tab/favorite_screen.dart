import 'package:evently/firebase_utils.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/ui/widgets/custom_text_form_feild.dart';
import 'package:evently/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';
import 'package:provider/provider.dart';

import '../../../../model/event.dart';
import '../../../widgets/custom_text_widget.dart';
import '../home_tab/list_view_container.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  Stream<List<Event>>? favouriteStream;
  List<Event> favoriteEventList = [];
  late UserProvider userProvider;
  List<Event> filterEvent = [];
  String searchText = '';

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      favouriteStream = FirebaseUtils.getFavoriteEvents(
        userProvider: userProvider,
      );
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Config.width(context) * 0.04,
            vertical: Config.height(context) * 0.01,
          ),
          child: Column(
            spacing: Config.height(context) * 0.02,
            children: [
              CustomTextFormFeild(
                onChanged: (text) {
                  searchText = text;
                  search(text);
                },
                hintText: AppLocalizations.of(context)!.search_for_event,
                sufixIcon: Icon(
                  Bootstrap.search,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Expanded(
                child: StreamBuilder(
                  stream: favouriteStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .primary,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return CustomTextWidget(text: snapshot.error.toString());
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return CustomTextWidget(
                        text: AppLocalizations.of(context)!.no_favorite_events,
                      );
                    } else {
                      favoriteEventList = snapshot.data!;

                      return favoriteEventList.isEmpty
                          ? CustomTextWidget(
                        text: AppLocalizations.of(
                          context,
                        )!.no_favorite_events,
                      )
                          : (filterEvent.isEmpty && searchText.isNotEmpty) ?
                      CustomTextWidget(text: AppLocalizations.of(context)!
                          .no_event_found)
                          :
                      ListViewContainer(
                        eventList: searchText.isEmpty
                            ? favoriteEventList
                            : filterEvent,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void search(String title) {
    filterEvent.clear();
    for (int i = 0; i < favoriteEventList.length; i++) {
      if (favoriteEventList[i].title.toLowerCase().contains(
        title.toLowerCase(),
      )) {
        filterEvent.add(favoriteEventList[i]);
      }
    }

    setState(() {});
  }
}
