import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'application/app/main_app.dart';
import 'core/di/injectable.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  configureDependencies();

  runApp(const MainApp());
}
