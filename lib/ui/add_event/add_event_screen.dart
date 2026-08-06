import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/add_event/custom_add_update_event.dart';
import 'package:flutter/material.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomAddUpdateEvent(
      appBarTitle: AppLocalizations.of(context)!.add_event,
      chooseDate: AppLocalizations.of(context)!.choose_date,
      chooseTime: AppLocalizations.of(context)!.choose_time,
      elevatedButtonText: AppLocalizations.of(context)!.add_event,
    );
  }

}
