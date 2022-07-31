import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';

class AppThemes {
  static ThemeData light = _AppTheme.getTheme(
    parent: ThemeData.light(),
    textTheme: _AppTextTheme.getTheme(colors: AppColors.light),
    colors: AppColors.light,
  );

  static ThemeData dark = _AppTheme.getTheme(
    parent: ThemeData.dark(),
    textTheme: _AppTextTheme.getTheme(colors: AppColors.dark),
    colors: AppColors.dark,
  );
}

class _AppTheme {
  static ThemeData getTheme({
    required ThemeData parent,
    required TextTheme textTheme,
    required AppColorsTheme colors,
  }) {
    return parent.copyWith(
      primaryColor: colors.backPrimary,
      cardColor: colors.white,
      backgroundColor: colors.backPrimary,
      scaffoldBackgroundColor: colors.backPrimary,
      disabledColor: colors.labelDisable,
      primaryIconTheme: IconThemeData(color: colors.blue),
      textTheme: textTheme,
    );
  }
}

class _AppTextTheme {
  static TextTheme getTheme({required AppColorsTheme colors}) {
    return TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 32.0,
        height: 37.5 / 32.0,
        fontWeight: FontWeight.w500,
        color: colors.labelPrimary,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 20.0,
        height: 32.0 / 20.0,
        fontWeight: FontWeight.w500,
        color: colors.labelPrimary,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16.0,
        height: 20.0 / 16.0,
        fontWeight: FontWeight.w400,
        color: colors.labelTertiary,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16.0,
        height: 20.0 / 16.0,
        fontWeight: FontWeight.w400,
        color: colors.labelPrimary,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14.0,
        height: 20.0 / 14.0,
        fontWeight: FontWeight.w400,
        color: colors.labelTertiary,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16.0,
        height: 18.0 / 16.0,
        fontWeight: FontWeight.w400,
        color: colors.labelTertiary,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14.0,
        height: 16.41 / 14.0,
        fontWeight: FontWeight.w400,
        color: colors.labelTertiary,
      ),
    );
  }
}
