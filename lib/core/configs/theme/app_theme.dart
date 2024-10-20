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
  );

  static OutlineInputBorder _inputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide.none,
    );
  }
}
