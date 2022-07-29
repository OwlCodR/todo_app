import 'dart:ui';

class AppColors {
  static final light = _AppColorsLight();
  static final dark = _AppColorsDark();
}

class _AppColorsLight {
  final backPrimary = const Color(0xFFF7F6F2);
  final backSecondary = const Color(0xFFFFFFFF);
  final backElevated = const Color(0xFFFFFFFF);
  final lightGray = const Color(0xFFD1D1D6);
  final gray = const Color(0xFF8E8E93);
  final white = const Color(0xFFFFFFFF);
  final blue = const Color(0xFF007AFF);
  final green = const Color(0xFF34C759);
  final red = const Color(0xFFFF3B30);
  final labelPrimary = const Color(0xFF000000);
  final labelSecondary = const Color(0x99000000);
  final labelTertiary = const Color(0x4D000000);
  final labelDisable = const Color(0x26000000);
  final separator = const Color(0x33000000);
  final overlay = const Color(0x0F000000);
}

class _AppColorsDark {
  final backPrimary = const Color(0xFF161618);
  final backSecondary = const Color(0xFF252528);
  final backElevated = const Color(0xFF3C3C3F);
  final lightGray = const Color(0xFF48484A);
  final gray = const Color(0xFF8E8E93);
  final white = const Color(0xFFFFFFFF);
  final blue = const Color(0xFF0A84FF);
  final green = const Color(0xFF32D74B);
  final red = const Color(0xFFFF453A);
  final labelPrimary = const Color(0xFFFFFFFF);
  final labelSecondary = const Color(0x99FFFFFF);
  final labelTertiary = const Color(0x66FFFFFF);
  final labelDisable = const Color(0x26FFFFFF);
  final separator = const Color(0x33FFFFFF);
  final overlay = const Color(0x52000000);
}
