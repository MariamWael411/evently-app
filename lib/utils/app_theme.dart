import 'package:evently/utils/app_color.dart';
import 'package:evently/utils/app_style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.backgroundLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.white,
      selectedItemColor: AppColor.blue,
      unselectedItemColor: AppColor.disableGrey,
      selectedLabelStyle: AppStyle.reg12Blue,
      unselectedLabelStyle: AppStyle.reg12disableGray,
    ),
    colorScheme: ColorScheme.light(
        primary: AppColor.blue,
        inversePrimary: AppColor.blue,
        onPrimaryContainer: AppColor.lightGrey,
        onPrimary: AppColor.white,
        onPrimaryFixed: AppColor.disableGrey
    ),

    textTheme: TextTheme(
      bodyLarge: AppStyle.semBold20Black,
      bodyMedium: AppStyle.reg16Gray,
      bodySmall: AppStyle.med18Blue,
        displayLarge: AppStyle.semBold14BlueUnderLine,
      displayMedium: AppStyle.reg14Blue,
      displaySmall: AppStyle.med20White,
      headlineLarge: AppStyle.semBold24Blue,
      headlineMedium: AppStyle.reg14Gray,
      headlineSmall: AppStyle.semBold14Blue,
      labelLarge: AppStyle.med16Blue,
      labelMedium: AppStyle.med18Blue,
      labelSmall: AppStyle.med18Black,
      titleLarge: AppStyle.med16Black,
      titleMedium: AppStyle.reg12Blue,
        titleSmall: AppStyle.semBold14Blue
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.backgroundDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.backgroundDark,
      selectedItemColor: AppColor.lightBlue,
      unselectedItemColor: AppColor.disableGrey,
      selectedLabelStyle: AppStyle.reg12lightBlue,
      unselectedLabelStyle: AppStyle.reg12disableGray,
    ),
    colorScheme: ColorScheme.dark(
        primary: AppColor.lightBlue,
        inversePrimary: AppColor.white,
        onPrimaryContainer: AppColor.borderDarkBlue,
        onPrimary: AppColor.darkBlue,
        onPrimaryFixed: AppColor.backgroundLight



    ),
    textTheme: TextTheme(
      bodyLarge: AppStyle.semBold20White,
      bodyMedium: AppStyle.reg16LightGray,
      bodySmall: AppStyle.med18White,
        displayLarge: AppStyle.semBold14LightBlueUnderLine,
      displayMedium: AppStyle.reg14White,
      displaySmall: AppStyle.med20White,
      headlineLarge: AppStyle.semBold24White,
      headlineMedium: AppStyle.reg14lightGray,
      headlineSmall: AppStyle.semBold14LightBlue,
      labelLarge: AppStyle.med16LightBlue,
      labelMedium: AppStyle.med18LightBlue,
      labelSmall: AppStyle.med18White,
      titleLarge: AppStyle.med16White,
      titleMedium: AppStyle.reg12lightBlue,
        titleSmall: AppStyle.semBold14White


    ),
  );
}
