import 'package:flutter/material.dart';

import 'application/app/main_app.dart';
import 'core/di/injectable.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  runApp(const MainApp());
}
