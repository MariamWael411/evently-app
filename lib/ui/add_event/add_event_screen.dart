import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/add_event/choose_date_and_time_widget.dart';
import 'package:evently/ui/add_event/list_view_add_event_widget.dart';
import 'package:evently/ui/widgets/custom_elevated_button.dart';
import 'package:evently/ui/widgets/custom_text_form_feild.dart';
import 'package:evently/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/language_provider.dart';
import '../../providers/theme_provider.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  List<String> titles = [];
  int currentIndex = 0;
  var title = '';
  var description = '';
  late LanguageProvider languageProvider;
  var formatDate = '';
  var formatTime = '';
  DateTime? dateTime;
  TimeOfDay? timeOfDay;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    languageProvider = Provider.of<LanguageProvider>(context);

    titles = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          AppLocalizations.of(context)!.add_event,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        centerTitle: true,
        leading: Container(
          margin: EdgeInsets.only(
            left: Config.width(context) * 0.02,
            top: Config.height(context) * 0.01,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              width: 2,
            ),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Config.width(context) * 0.04,
          vertical: Config.height(context) * 0.02,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,

            child: Column(
              spacing: Config.height(context) * 0.01,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListViewAddEventWidget(),
                text(AppLocalizations.of(context)!.title),
                CustomTextFormFeild(
                  hintText: AppLocalizations.of(context)!.event_title,
                  onChanged: (text) {
                    title = text;
                  },
                  onValidator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return AppLocalizations.of(context)!.please_enter_title;
                    }
                    return null;
                  },
                ),
                text(AppLocalizations.of(context)!.description),
                CustomTextFormFeild(
                  hintText: AppLocalizations.of(context)!.event_description,
                  onChanged: (text) {
                    description = text;
                  },
                  onValidator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return AppLocalizations.of(
                        context,
                      )!.please_enter_description;
                    }
                    return null;
                  },
                  maxLines: 6,
                ),
                ChooseDateAndTimeWidget(
                  iconData: Iconsax.calendar_1_outline,
                  eventData: AppLocalizations.of(context)!.event_date,
                  chooseData: dateTime == null
                      ? AppLocalizations.of(context)!.choose_date
                      : formatDate,
                  onClick: chooseDate,
                ),
                ChooseDateAndTimeWidget(
                  iconData: Iconsax.timer_1_outline,
                  eventData: AppLocalizations.of(context)!.event_time,
                  chooseData: timeOfDay == null
                      ? AppLocalizations.of(context)!.choose_time
                      : formatTime,
                  onClick: chooseTime,
                ),
                CustomElevatedButton(
                  onClick: addEvent,
                  text: AppLocalizations.of(context)!.add_event,
                ),
                SizedBox(height: Config.height(context) * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text text(String text) {
    return Text(text, style: Theme.of(context).textTheme.titleLarge);
  }

  void addEvent() {
    if (formKey.currentState?.validate() == true) {
      //todo add event
    }
  }

  void chooseTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    timeOfDay = time;
    formatTime = time!.format(context);

    setState(() {});
  }

  void chooseDate() async {
    final date = await showDatePickerDialog(
      context: context,
      minDate: DateTime.now(),
      maxDate: DateTime.now().add(Duration(days: 365)),
      selectedDate: DateTime.now(),
      dialogBackground: Theme.of(context).colorScheme.onSecondaryContainer,
      height: Config.height(context) * 0.6,
      width: Config.width(context) * 0.9,
    );
    dateTime = date;
    formatDate = new DateFormat('dd/MM/yyyy').format(dateTime!);
    setState(() {});
  }
}
