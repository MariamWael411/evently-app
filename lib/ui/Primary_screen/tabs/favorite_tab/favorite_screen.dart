import 'package:evently/firebase_utils.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/ui/Primary_screen/tabs/home_tab/stream_builder_widget.dart';
import 'package:evently/ui/widgets/custom_text_form_feild.dart';
import 'package:evently/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';
import 'package:provider/provider.dart';

import '../../../../model/event.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  Stream<List<Event>>? favouriteStream;
  List<Event> favoriteEventList = [];
  late UserProvider userProvider;

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
                hintText: AppLocalizations.of(context)!.search_for_event,
                sufixIcon: Icon(
                  Bootstrap.search,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Expanded(
                child: StreamBuilderWidget(
                  eventList: favoriteEventList,
                  stream: favouriteStream,
                  text: AppLocalizations.of(context)!.no_favorite_events,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
