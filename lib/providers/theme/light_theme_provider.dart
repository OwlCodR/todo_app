import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../themes/themes.dart';
import 'light_colors_provider.dart';

final lightThemeProvider = StateProvider((ref) {
  final lightColors = ref.watch(lightColorsProvider);

  return AppTheme.getTheme(
    parent: ThemeData.light(),
    textTheme: AppTextTheme.getTheme(colors: lightColors),
    colors: lightColors,
  );
});
