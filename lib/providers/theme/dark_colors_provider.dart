import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/app_colors.dart';

final darkColorsProvider = StateProvider((ref) {
  return AppColorsTheme(
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
});
