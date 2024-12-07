import 'package:flutter/material.dart';

const typeTheme = Typography.whiteMountainView;

class AppColors {
  static const Color primaryColor = Color.fromARGB(255, 45, 240, 247);
  static const Color secondaryColor = Color.fromARGB(255, 106, 255, 243);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color greyColor = Color(0xFFE5E5E5);
  static const Color yellowCardColor = Color.fromARGB(255, 248, 236, 167);
  static const Color yellowTextColor = Color.fromARGB(255, 255, 145, 0);

  static const Color backgroundLight = Color(0xFFF7F7FA);
  static const Color cardBackgroundLight = Color(0xFFFFFFFF);

  static const Color backgroundDark = Color(0xFF212743);
  static const Color cardBackgroundDark = Color(0xFF1D1F33);
}

TextTheme txtTheme = Typography.whiteMountainView.copyWith(
  bodyLarge: typeTheme.bodyLarge?.copyWith(fontSize: 16),
  bodyMedium: typeTheme.bodyLarge?.copyWith(fontSize: 14),
  displayLarge: typeTheme.bodyLarge?.copyWith(fontSize: 32),
  displayMedium: typeTheme.bodyLarge?.copyWith(fontSize: 28),
  displaySmall: typeTheme.bodyLarge?.copyWith(fontSize: 24),
  headlineMedium: typeTheme.bodyLarge?.copyWith(fontSize: 21),
  headlineSmall: typeTheme.bodyLarge?.copyWith(fontSize: 18),
  titleLarge: typeTheme.bodyLarge?.copyWith(fontSize: 16),
  titleMedium: typeTheme.bodyLarge?.copyWith(fontSize: 24),
  titleSmall: typeTheme.bodyLarge?.copyWith(fontSize: 21),
);

ThemeData light = ThemeData(
    fontFamily: 'regular',
    primaryColor: AppColors.primaryColor,
    secondaryHeaderColor: AppColors.secondaryColor,
    disabledColor: const Color(0xFFBABFC4),
    brightness: Brightness.light,
    hintColor: const Color(0xFF9F9F9F),
    cardColor: AppColors.cardBackgroundLight,
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.blackColor)),
    textTheme: txtTheme,
    colorScheme: const ColorScheme.light(
            primary: AppColors.primaryColor,
            secondary: AppColors.secondaryColor)
        .copyWith(surface: const Color(0xFFF3F3F3))
        .copyWith(error: const Color(0xFFE84D4F)));

ThemeData dark = ThemeData(
    fontFamily: 'regular',
    primaryColor: AppColors.primaryColor,
    secondaryHeaderColor: AppColors.secondaryColor,
    disabledColor: const Color(0xffa2a7ad),
    brightness: Brightness.dark,
    hintColor: const Color(0xFFbebebe),
    cardColor: AppColors.cardBackgroundDark,
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.whiteColor)),
    textTheme: txtTheme,
    colorScheme: const ColorScheme.dark(
            primary: AppColors.blackColor, secondary: Color(0xFFffbd5c))
        .copyWith(surface: const Color(0xFF343636))
        .copyWith(error: const Color(0xFFdd3135)));
