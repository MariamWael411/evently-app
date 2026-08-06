import 'package:evently/firebase_utils.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/event.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/ui/add_event/custom_add_update_event.dart';
import 'package:evently/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class UpdateEvent extends StatefulWidget {
  const UpdateEvent({super.key});

  @override
  State<UpdateEvent> createState() => _UpdateEventState();
}

class _UpdateEventState extends State<UpdateEvent> {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as Event;
    return CustomAddUpdateEvent(
      index: args.index,
      elevatedButtonText: AppLocalizations.of(context)!.update_event,
      appBarTitle: AppLocalizations.of(context)!.edit_event,
      titleInEdit: args.title,
      descInEdit: args.description,
      chooseDate: DateFormat('dd / MM / yyyy').format(args.date).toString(),
      chooseTime: DateFormat('hh:mm a').format(args.date).toString(),
      updateEvent: () {
        FirebaseUtils.updateAllEvent(
              userId: userProvider.myUser!.id,
              event: args,
            )
            .then((value) {
              Navigator.pop(context);
              ToastUtils.showToastMessage(
                message: AppLocalizations.of(context)!.event_udate_successfully,
                context: context,
              );
            })
            .catchError((error) {
              ToastUtils.showToastMessage(
                message: error.toString(),
                context: context,
              );
            });
      },
    );
  }
}
