import 'package:flutter/material.dart';
import 'package:todo_app/constants/app_colors.dart';

class AppTheme {
  static ThemeData getTheme({
    required ThemeData parent,
    required TextTheme textTheme,
    required AppColorsTheme colors,
  }) {
    return parent.copyWith(
      focusColor: colors.blue,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colors.blue,
        foregroundColor: colors.white,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colors.backSecondary,
        contentTextStyle: TextStyle(color: colors.white),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? colors.blue
              : colors.backElevated,
        ),
        trackColor: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? colors.blue.withOpacity(0.30)
              : colors.overlay,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? colors.green
              : colors.separator,
        ),
        checkColor: MaterialStateProperty.resolveWith(
          (states) => colors.red,
        ),
      ),
      primaryColorLight: colors.green,
      primaryColor: colors.backPrimary,
      primaryColorDark: colors.separator,
      cardColor: colors.white,
      backgroundColor: colors.backPrimary,
      scaffoldBackgroundColor: colors.backPrimary,
      disabledColor: colors.labelDisable,
      errorColor: colors.red,
      primaryIconTheme: IconThemeData(color: colors.blue),
      indicatorColor: colors.blue,
      iconTheme: IconThemeData(color: colors.labelTertiary),
      cardTheme: CardTheme(color: colors.backSecondary),
      textTheme: textTheme,
    );
  }
}

class AppTextTheme {
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
      labelSmall: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16.0,
        height: 20.0 / 16.0,
        decoration: TextDecoration.lineThrough,
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
        color: colors.labelTertiary,
      ),
    );
  }
}
