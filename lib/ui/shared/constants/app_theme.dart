import 'package:flutter/material.dart';

import '_constants.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.lightPrimary,
      background: AppColors.lightBg,
      onBackground: AppColors.lightPrimary,
      // primary: AppColors.lightPrimary,
      // surfaceTint: AppColors.transparent,
      // onSurface: AppColors.lightText,
      // surface: AppColors.lightBg,
      secondary: AppColors.lightSecondary,
      onSecondary: AppColors.lightOnSecondary,
    ),
    fontFamily: AppTextStyles.lexend,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      backgroundColor: AppColors.lightBg,
      elevation: 0,
    ),
    textTheme: textTheme,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      // fillColor: AppColors.lightField,
      hintStyle: textTheme.bodyMedium,
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: AppColors.darkPrimary,
      background: AppColors.darkBg,
      onBackground: AppColors.darkPrimary,
      // primary: AppColors.darkPrimary,
      // onSurface: AppColors.darkText,
      // surface: AppColors.darkBg,
      secondary: AppColors.darkSecondary,
      onSecondary: AppColors.darkOnSecondary,
    ),
    fontFamily: AppTextStyles.lexend,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      backgroundColor: AppColors.darkBg,
      elevation: 0,
    ),
    textTheme: textTheme,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      // fillColor: AppColors.darkField,
      hintStyle: textTheme.bodyMedium,
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );

  static TextTheme get textTheme => const TextTheme(
        // displayLarge: AppTextStyles.bold32,
        // headlineLarge: AppTextStyles.bold18,
        // titleLarge: AppTextStyles.bold16,
        titleMedium: AppTextStyles.medium16,
        titleSmall: AppTextStyles.regular16,
        bodyLarge: AppTextStyles.bold14,
        bodySmall: AppTextStyles.regular14,
        labelSmall: AppTextStyles.regular12,
      );
}
