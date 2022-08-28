import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/theme/dark_colors_provider.dart';

import '../../themes/themes.dart';

final darkThemeProvider = StateProvider((ref) {
  final darkColors = ref.watch(darkColorsProvider);

  return AppTheme.getTheme(
    parent: ThemeData.dark(),
    textTheme: AppTextTheme.getTheme(colors: darkColors),
    colors: darkColors,
  );
});
