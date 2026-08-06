import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/Dialog_language/dialog_language.dart';
import 'package:evently/utils/app_color.dart';
import 'package:evently/utils/app_image.dart';
import 'package:evently/utils/app_route.dart';
import 'package:evently/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/theme_provider.dart';
import '../../../../providers/user_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          spacing: Config.width(context) * 0.05,
          children: [
            SizedBox(height: Config.height(context) * 0.03),
            ClipOval(child: Image.asset(AppImage.profileImage)),
            Text(
              userProvider.myUser!.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              userProvider.myUser!.email,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            container(
              AppLocalizations.of(context)!.dark_mode,
              Switch(
                value: (themeProvider.isDark()),
                inactiveThumbColor: AppColor.white,
                activeThumbColor: AppColor.white,
                activeTrackColor: AppColor.lightBlue,
                inactiveTrackColor: AppColor.swithGrey,
                trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((
                  Set<WidgetState> states,
                ) {
                  if (states.contains(WidgetState.selected)) {
                    return Colors.transparent;
                  }
                  return AppColor.white;
                }),

                onChanged: (value) {
                  if (value) {
                    themeProvider.changeThemeToDark(ThemeMode.dark);
                  } else {
                    themeProvider.changeThemeToDark(ThemeMode.light);
                  }
                },
              ),
            ),
            container(
              AppLocalizations.of(context)!.language,
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DialogLanguage();
                    },
                  );
                },
              ),
            ),
            container(
              AppLocalizations.of(context)!.logout,
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoute.loginScreen,
                    (route) => false,
                  );
                },
                icon: Icon(Icons.logout_sharp, color: AppColor.red),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container container(String text, Widget icon) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Config.width(context) * 0.04,
        vertical: Config.height(context) * 0.01,
      ),
      margin: EdgeInsets.symmetric(horizontal: Config.width(context) * 0.03),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: Theme.of(context).textTheme.titleLarge),
          icon,
        ],
      ),
    );
  }
}
