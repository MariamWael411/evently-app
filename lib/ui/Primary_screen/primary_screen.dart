import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/Primary_screen/tabs/favorite_screen.dart';
import 'package:evently/ui/Primary_screen/tabs/home_screen.dart';
import 'package:evently/ui/Primary_screen/tabs/profile_screen.dart';
import 'package:evently/utils/app_color.dart';
import 'package:evently/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';

class PrimaryScreen extends StatefulWidget {
  PrimaryScreen({super.key});

  @override
  State<PrimaryScreen> createState() => _PrimaryScreenState();
}

class _PrimaryScreenState extends State<PrimaryScreen> {
  List<Widget> tabs = [HomeScreen(), FavoriteScreen(), ProfileScreen()];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          tabs[selectedIndex],
          Positioned(
            bottom: Config.height(context) * 0.04,
            right: Config.width(context) * 0.05,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(Config.width(context) * 0.05),
                shape: StadiumBorder(),
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: Icon(Icons.add, color: AppColor.white, size: 24),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(34),
          topLeft: Radius.circular(34),
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;

            setState(() {});
          },
          items: [
            bottomNavigationBarItem(
              Icon(Bootstrap.house),
              AppLocalizations.of(context)!.home,
              Icon(Bootstrap.house_fill),
              0,
            ),
            bottomNavigationBarItem(
              Icon(Bootstrap.heart),
              AppLocalizations.of(context)!.favorite,
              Icon(Bootstrap.heart_fill),
              1,
            ),
            bottomNavigationBarItem(
              Icon(Bootstrap.person),
              AppLocalizations.of(context)!.profile,
              Icon(Bootstrap.person_fill),
              2,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem(
    Icon icon,
    String label,
    Icon activeIcon,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
      activeIcon: activeIcon,
    );
  }
}
