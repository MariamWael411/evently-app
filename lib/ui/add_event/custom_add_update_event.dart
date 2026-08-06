import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:evently/firebase_utils.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/event.dart';
import 'package:evently/model/model_app.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/ui/add_event/choose_date_and_time_widget.dart';
import 'package:evently/ui/add_event/list_view_add_event_widget.dart';
import 'package:evently/ui/widgets/custom_elevated_button.dart';
import 'package:evently/ui/widgets/custom_text_form_feild.dart';
import 'package:evently/utils/config.dart';
import 'package:evently/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/event_provider.dart';
import '../../providers/language_provider.dart';
import '../../providers/theme_provider.dart';
import '../../utils/app_color.dart';
import '../widgets/custom_leading_widget.dart';

class CustomAddUpdateEvent extends StatefulWidget {
  String appBarTitle;
  String? titleInEdit;
  String? descInEdit;
  String chooseDate;
  String chooseTime;
  String elevatedButtonText;
  VoidCallback? updateEvent;
  int index;
  VoidCallback? addEvent;

  CustomAddUpdateEvent({
    super.key,
    required this.appBarTitle,
    this.titleInEdit,
    this.descInEdit,
    required this.chooseDate,
    required this.chooseTime,
    required this.elevatedButtonText,
    this.updateEvent,
    this.index = 0,
    this.addEvent,
  });

  late TextEditingController titleController = TextEditingController(
    text: titleInEdit ?? '',
  );
  late TextEditingController descController = TextEditingController(
    text: descInEdit ?? '',
  );

  @override
  State<CustomAddUpdateEvent> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<CustomAddUpdateEvent> {
  List<String> titles = [];
  var title = '';
  var description = '';
  late LanguageProvider languageProvider;
  var formatDate = '';
  var formatTime = '';
  DateTime? dateTime;
  TimeOfDay? timeOfDay;
  var formKey = GlobalKey<FormState>();
  var selectedImage = '';
  late UserProvider userProvider;
  var eventName = '';
  late EventProvider eventProvider;
  late String chooseTimeStr = widget.chooseTime;
  late String chooseDateStr = widget.chooseDate;
  late Event? args;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_initialized) {
      eventProvider = Provider.of<EventProvider>(context, listen: false);

      args = ModalRoute.of(context)?.settings.arguments as Event?;

      if (args != null) {
        eventProvider.changeIndex(args!.index - 1);
      } else {
        eventProvider.changeIndex(0);
      }

      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    eventProvider = Provider.of<EventProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    languageProvider = Provider.of<LanguageProvider>(context);
    selectedImage = themeProvider.isDark()
        ? ModelApp.imagesDark[eventProvider.currentIndex]
        : ModelApp.imagesLight[eventProvider.currentIndex];
    userProvider = Provider.of<UserProvider>(context);

    titles = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
    ];
    eventName = titles[eventProvider.currentIndex];
    if (args != null) {
      args?.name = titles[eventProvider.currentIndex];
      //args?.index=eventProvider.currentIndex;
      args?.image = selectedImage;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.transparent,
        title: Text(
          widget.appBarTitle,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        centerTitle: true,
        leading: CustomLeadingWidget(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).colorScheme.primary,
          ),
          onTap: () {
            Navigator.pop(context);
          },
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
                    args?.title = text;
                    title = text;
                  },
                  controller: widget.titleController,
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
                    args?.description = text;
                    description = text;
                  },
                  controller: widget.descController,
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
                  chooseData: chooseDateStr,
                  onClick: chooseDate,
                ),
                ChooseDateAndTimeWidget(
                  iconData: Iconsax.timer_1_outline,
                  eventData: AppLocalizations.of(context)!.event_time,
                  chooseData: chooseTimeStr,
                  onClick: chooseTime,
                ),
                CustomElevatedButton(
                  onClick: widget.updateEvent ?? addEvent,
                  text: widget.elevatedButtonText,
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
      Event event = Event(
        name: eventName,
        title: title,
        description: description,
        image: selectedImage,
        date: DateTime(
          dateTime!.year,
          dateTime!.month,
          dateTime!.day,
          timeOfDay!.hour,
          timeOfDay!.minute,
        ),
        index: eventProvider.currentIndex + 1,
        userId: userProvider.myUser!.id,
      );
      FirebaseUtils.addEventInFireStore(event)
          .then((value) {
            Navigator.pop(context);
            ToastUtils.showToastMessage(
              message: AppLocalizations.of(context)!.event_added_successfully,
              context: context,
            );
          })
          .catchError((error) {
            ToastUtils.showToastMessage(
              message: error.toString(),
              context: context,
            );
          });
    }
  }

  void chooseTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    timeOfDay = time;
    chooseTimeStr = time!.format(context);

    if (dateTime != null) {
      args?.date = DateTime(
        dateTime!.year,
        dateTime!.month,
        dateTime!.day,
        timeOfDay!.hour,
        timeOfDay!.minute,
      );
    }
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

    chooseDateStr = new DateFormat('dd/MM/yyyy').format(dateTime!);
    if (timeOfDay != null) {
      args?.date = DateTime(
        dateTime!.year,
        dateTime!.month,
        dateTime!.day,
        timeOfDay!.hour,
        timeOfDay!.minute,
      );
    }
    setState(() {});
  }
}
