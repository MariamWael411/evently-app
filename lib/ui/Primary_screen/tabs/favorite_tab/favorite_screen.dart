import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/Primary_screen/tabs/home_tab/list_view_container.dart';
import 'package:evently/ui/widgets/custom_text_form_feild.dart';
import 'package:evently/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Config.width(context) * 0.04,
                vertical: Config.height(context) * 0.01
            ),
            child: Column(
              spacing: Config.height(context) * 0.02,
              children: [
                CustomTextFormFeild(
                  hintText: AppLocalizations.of(context)!.search_for_event,
                  sufixIcon: Icon(Bootstrap.search, color: Theme
                      .of(context)
                      .colorScheme
                      .primary,),
                ),
                Expanded(child: ListViewContainer())
              ],
            ),
          )),
    );
  }
}
