import 'package:flutter/material.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.lightModeBackgroundColor,
    fontFamily: 'Inter',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: AppColors.primaryTextColorLightMode),
      titleLarge: TextStyle(color: AppColors.primaryTextColorLightMode),
      bodyLarge: TextStyle(color: AppColors.hintTextColorLightMode),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.fillColorLightMode,
      hintStyle: const TextStyle(
        color: AppColors.hintTextColorLightMode,
        fontWeight: FontWeight.w500,
      ),
      contentPadding: const EdgeInsets.all(20),
      border: _inputBorder(),
      enabledBorder: _inputBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.fillColorLightMode,
      elevation: 0,
      type: BottomNavigationBarType.shifting,
      landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      enableFeedback: false,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.fillColorDarkMode,
      actionTextColor: AppColors.hintTextColorLightMode,
    ),
    hintColor: AppColors.primaryTextColorLightMode,
    primaryColorLight: AppColors.hintTextColorLightMode,
    primaryColorDark: AppColors.hintTextColorDarkMode,
    primaryIconTheme:
        const IconThemeData(color: AppColors.hintTextColorLightMode),
    primaryTextTheme: const TextTheme(
      titleLarge: TextStyle(color: AppColors.hintTextColorLightMode),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.darkModeBackgroundColor,
    fontFamily: 'Inter',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: AppColors.primaryTextColorDarkMode),
      titleLarge: TextStyle(color: AppColors.primaryTextColorDarkMode),
      bodyLarge: TextStyle(color: AppColors.hintTextColorDarkMode),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.fillColorDarkMode,
      hintStyle: const TextStyle(
        color: AppColors.hintTextColorDarkMode,
        fontWeight: FontWeight.w500,
      ),
      contentPadding: const EdgeInsets.all(20),
      border: _inputBorder(),
      enabledBorder: _inputBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.fillColorDarkMode,
      elevation: 0,
      type: BottomNavigationBarType.shifting,
      landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      enableFeedback: false,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.fillColorLightMode,
      actionTextColor: AppColors.hintTextColorDarkMode,
    ),
    hintColor: AppColors.primaryTextColorDarkMode,
    primaryColorLight: AppColors.hintTextColorLightMode,
    primaryColorDark: AppColors.hintTextColorDarkMode,
    primaryIconTheme:
        const IconThemeData(color: AppColors.hintTextColorDarkMode),
    primaryTextTheme: const TextTheme(
      titleLarge: TextStyle(color: AppColors.hintTextColorDarkMode),
    ),
  );

  static OutlineInputBorder _inputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide.none,
    );
  }
}
