import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';

class AppThemes {
  static ThemeData light = _lightTheme();
  static ThemeData dark = _darkTheme();

  static ThemeData _lightTheme() {
    final colors = AppColors.light;

    return ThemeData.light().copyWith(
      primaryColor: colors.backPrimary,
      cardColor: colors.white,
      backgroundColor: colors.backPrimary,
      scaffoldBackgroundColor: colors.backPrimary,
      disabledColor: colors.labelDisable,
    );
  }

  static ThemeData _darkTheme() {
    final colors = AppColors.dark;

    return ThemeData.dark().copyWith(
      primaryColor: colors.backPrimary,
      cardColor: colors.white,
      backgroundColor: colors.backPrimary,
      scaffoldBackgroundColor: colors.backPrimary,
      disabledColor: colors.labelDisable,
    );
  }
}
