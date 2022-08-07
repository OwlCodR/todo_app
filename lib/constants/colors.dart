import 'dart:ui';

class AppColors {
  static final light = AppColorsTheme(
    backPrimary: const Color(0xFFF7F6F2),
    backSecondary: const Color(0xFFFFFFFF),
    backElevated: const Color(0xFFFFFFFF),
    lightGray: const Color(0xFFD1D1D6),
    gray: const Color(0xFF8E8E93),
    white: const Color(0xFFFFFFFF),
    blue: const Color(0xFF007AFF),
    green: const Color(0xFF34C759),
    red: const Color(0xFFFF3B30),
    labelPrimary: const Color(0xFF000000),
    labelSecondary: const Color(0x99000000),
    labelTertiary: const Color(0x4D000000),
    labelDisable: const Color(0x26000000),
    separator: const Color(0x33000000),
    overlay: const Color(0x0F000000),
  );

  static final dark = AppColorsTheme(
    backPrimary: const Color(0xFF161618),
    backSecondary: const Color(0xFF252528),
    backElevated: const Color(0xFF3C3C3F),
    lightGray: const Color(0xFF48484A),
    gray: const Color(0xFF8E8E93),
    white: const Color(0xFFFFFFFF),
    blue: const Color(0xFF0A84FF),
    green: const Color(0xFF32D74B),
    red: const Color(0xFFFF453A),
    labelPrimary: const Color(0xFFFFFFFF),
    labelSecondary: const Color(0x99FFFFFF),
    labelTertiary: const Color(0x66FFFFFF),
    labelDisable: const Color(0x26FFFFFF),
    separator: const Color(0x33FFFFFF),
    overlay: const Color(0x52000000),
  );
}

class AppColorsTheme {
  Color backPrimary;
  Color backSecondary;
  Color backElevated;
  Color lightGray;
  Color gray;
  Color white;
  Color blue;
  Color green;
  Color red;
  Color labelPrimary;
  Color labelSecondary;
  Color labelTertiary;
  Color labelDisable;
  Color separator;
  Color overlay;

  AppColorsTheme({
    required this.backPrimary,
    required this.backSecondary,
    required this.backElevated,
    required this.lightGray,
    required this.gray,
    required this.white,
    required this.blue,
    required this.green,
    required this.red,
    required this.labelPrimary,
    required this.labelSecondary,
    required this.labelTertiary,
    required this.labelDisable,
    required this.separator,
    required this.overlay,
  });
}
