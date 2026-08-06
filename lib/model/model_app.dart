import 'package:flutter/cupertino.dart';
import 'package:icon_plus/icon_plus.dart';

import '../utils/app_image.dart';

class ModelApp {
  static List<IconData> unSelectedIcons = [
    Bootstrap.grid,
    Bootstrap.bicycle,
    Bootstrap.cake,
    Bootstrap.calendar,
    Bootstrap.book,
    Bootstrap.image,
  ];
  static List<IconData> selectedIcons = [
    Iconsax.category_bold,
    FontAwesome.bicycle_solid,
    Bootstrap.cake_fill,
    Bootstrap.calendar_fill,
    FontAwesome.book_open_solid,
    Bootstrap.image_fill,
  ];
  static List<String> imagesLight = [
    AppImage.sportLight,
    AppImage.birthdayLight,
    AppImage.meetingLight,
    AppImage.bookClubLight,
    AppImage.exhibitionLight,
  ];
  static List<String> imagesDark = [
    AppImage.sportDark,
    AppImage.birthdayDark,
    AppImage.meetingDark,
    AppImage.bookClubDark,
    AppImage.exhibitionDark,
  ];
}
