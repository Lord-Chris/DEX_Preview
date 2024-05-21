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
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.green;
        }
        return AppColors.transparent;
      }),
      checkColor: MaterialStateProperty.all(AppColors.lightOnSecondary),
      visualDensity: VisualDensity.compact,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    textTheme: textTheme,
    inputDecorationTheme: InputDecorationTheme(
      filled: false,
      hintStyle: AppTextStyles.medium12.copyWith(
        color: AppColors.lightOnSecondary,
      ),
      contentPadding: const EdgeInsets.fromLTRB(16, 13, 16, 13),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.lightSecondary, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.lightSecondary, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.lightSecondary, width: 1),
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
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.green;
        }
        return AppColors.transparent;
      }),
      checkColor: MaterialStateProperty.all(AppColors.darkOnSecondary),
      visualDensity: VisualDensity.compact,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    textTheme: textTheme,
    inputDecorationTheme: InputDecorationTheme(
      filled: false,
      hintStyle: AppTextStyles.medium12.copyWith(
        color: AppColors.darkOnSecondary,
      ),
      contentPadding: const EdgeInsets.fromLTRB(16, 13, 16, 13),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide:
            const BorderSide(color: AppColors.darkFieldBorder, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide:
            const BorderSide(color: AppColors.darkFieldBorder, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide:
            const BorderSide(color: AppColors.darkFieldBorder, width: 1),
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
