import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';

class Themedata {

  static getThemData(bool isDarkMode) {
    ThemeData themedata = ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        primarySwatch: AppColors.kPrimarySwatch,
        primaryColor:
            isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor,
        primaryColorDark:
            isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor,
        primaryColorLight:
            isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor,
        //---------Scaffold-Theme-------------
        scaffoldBackgroundColor: isDarkMode
            ? AppColors.kscaffoldBackgroundDark
            : AppColors.kscaffoldBackgroundLight,
        //---------Drawer-Theme-------------
        drawerTheme: DrawerThemeData(
            backgroundColor: isDarkMode
                ? AppColors.kPrimarydark
                : AppColors.kappBarColorlight),
        //---------Text-Theme-------------
        primaryTextTheme: TextTheme(
          displayLarge: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          displayMedium: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          displaySmall: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          headlineLarge: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          headlineMedium: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          headlineSmall: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          titleLarge: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          titleMedium: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          titleSmall: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          bodyLarge: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          bodyMedium: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          bodySmall: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          labelLarge: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          labelMedium: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          labelSmall: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          displayMedium: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          displaySmall: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          headlineLarge: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          headlineMedium: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          headlineSmall: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          titleLarge: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          titleMedium: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          titleSmall: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          bodyLarge: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          bodyMedium: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          bodySmall: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          labelLarge: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          labelMedium: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
          labelSmall: TextStyle(
              color:
                  isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
        ),
        //---------Divider-Theme-------------
        dividerTheme:const DividerThemeData(
          thickness: 1,
            // color: isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor
          ),
        //---------AppBar-Theme-------------
        appBarTheme: AppBarTheme(
            backgroundColor: isDarkMode
                ? AppColors.kappBarColordark
                : AppColors.kappBarColorlight),
        //---------Icon-Theme-------------
        iconTheme: IconThemeData(
            color: isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
        iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all<Color>(
                    isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
                iconColor: MaterialStateProperty.all<Color>(
                    isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor),
                foregroundColor: MaterialStateProperty.all<Color>(isDarkMode
                    ? AppColors.kwhiteColor
                    : AppColors.kblackColor))),
        //---------Card-Theme-------------
        cardColor: isDarkMode ? AppColors.kPrimarydark : AppColors.kwhiteColor);
       //-------Progress Indicator---------\
      //  progressIndicatorTheme: ProgressIndicatorThemeData(
      //   circularTrackColor: isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor,
      //   color:isDarkMode ? AppColors.kwhiteColor : AppColors.kblackColor,
      // );
    return themedata;
  }
}
