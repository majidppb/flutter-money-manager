import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorSchemeSeed: Colors.blueGrey,
  inputDecorationTheme: _inputDecorationTheme,
);

final darkTheme = lightTheme.copyWith(brightness: Brightness.dark);

final _inputDecorationTheme = InputDecorationTheme(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  ),
);
