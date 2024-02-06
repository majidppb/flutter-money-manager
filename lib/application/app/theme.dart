import 'package:flutter/material.dart';

import '../core/colors.dart';

final light = ThemeData(
  brightness: Brightness.light,
  colorSchemeSeed: kAppSeedColor,
  inputDecorationTheme: _inputDecoration,
  snackBarTheme: _snackBar,
);

final dark = ThemeData(
  colorSchemeSeed: kAppSeedColor,
  brightness: Brightness.dark,
  inputDecorationTheme: _inputDecoration,
  snackBarTheme: _snackBar,
);

const _snackBar = SnackBarThemeData(showCloseIcon: true);

final _inputDecoration = InputDecorationTheme(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  ),
);
