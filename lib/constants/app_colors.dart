import 'dart:ui';

class AppColorsTheme {
  final Color backPrimary;
  final Color backSecondary;
  final Color backElevated;
  final Color lightGray;
  final Color gray;
  final Color white;
  final Color blue;
  final Color green;
  final Color red;
  final Color labelPrimary;
  final Color labelSecondary;
  final Color labelTertiary;
  final Color labelDisable;
  final Color separator;
  final Color overlay;

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

  AppColorsTheme copyWith({
    Color? backPrimary,
    Color? backSecondary,
    Color? backElevated,
    Color? lightGray,
    Color? gray,
    Color? white,
    Color? blue,
    Color? green,
    Color? red,
    Color? labelPrimary,
    Color? labelSecondary,
    Color? labelTertiary,
    Color? labelDisable,
    Color? separator,
    Color? overlay,
  }) {
    return AppColorsTheme(
      backPrimary: backPrimary ?? this.backPrimary,
      backSecondary: backSecondary ?? this.backSecondary,
      backElevated: backElevated ?? this.backElevated,
      lightGray: lightGray ?? this.lightGray,
      gray: gray ?? this.gray,
      white: white ?? this.white,
      blue: blue ?? this.blue,
      green: green ?? this.green,
      red: red ?? this.red,
      labelPrimary: labelPrimary ?? this.labelPrimary,
      labelSecondary: labelSecondary ?? this.labelSecondary,
      labelTertiary: labelTertiary ?? this.labelTertiary,
      labelDisable: labelDisable ?? this.labelDisable,
      separator: separator ?? this.separator,
      overlay: overlay ?? this.overlay,
    );
  }
}
