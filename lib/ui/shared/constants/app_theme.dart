import 'package:flutter/material.dart';

import '_constants.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.lightPrimary,
      background: AppColors.lightBg,
      onBackground: AppColors.lightPrimary,
      surfaceTint: AppColors.transparent,
      // primary: AppColors.lightPrimary,
      // onSurface: AppColors.lightText,
      // surface: AppColors.lightBg,
      secondary: AppColors.lightSecondary,
      onSecondary: AppColors.lightOnSecondary,
      primaryContainer: AppColors.lightActive,
      secondaryContainer: AppColors.lightActive2,
    ),
    fontFamily: AppTextStyles.lexend,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      backgroundColor: AppColors.lightBg,
      elevation: 1,
      surfaceTintColor: AppColors.transparent,
      foregroundColor: AppColors.transparent,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.lightSheetBg,
      surfaceTintColor: AppColors.transparent,
    ),
    textTheme: textTheme,
    inputDecorationTheme: InputDecorationTheme(
      filled: false,
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
      surfaceTint: AppColors.transparent,
      // primary: AppColors.darkPrimary,
      // onSurface: AppColors.darkText,
      // surface: AppColors.darkBg,
      secondary: AppColors.darkSecondary,
      onSecondary: AppColors.darkOnSecondary,
      primaryContainer: AppColors.darkActive,
      secondaryContainer: AppColors.darkActive2,
    ),
    fontFamily: AppTextStyles.lexend,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      backgroundColor: AppColors.darkBg,
      surfaceTintColor: AppColors.transparent,
      foregroundColor: AppColors.transparent,
      elevation: 1,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.darkSheetBg,
      surfaceTintColor: AppColors.transparent,
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
