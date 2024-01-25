import 'package:flutter/material.dart';

import '../pages/transactions/transactions/transactions.dart';
import 'routes.dart';
import 'theme.dart' as theme;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Manager',
      themeMode: ThemeMode.system,
      theme: theme.lightTheme,
      darkTheme: theme.darkTheme,
      restorationScopeId: 'root',
      routes: routes,
      initialRoute: TransactionsPage.path,
    );
  }
}