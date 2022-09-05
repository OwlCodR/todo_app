import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/app_colors.dart';

final lightColorsProvider = StateProvider((ref) {
  return AppColorsTheme(
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
});
