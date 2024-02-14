import 'package:flutter/material.dart';

import '../../core/di/injectable.dart';
import '../../domain/repositories/auth_service.dart';
import '../pages/sign_in/sign_in.dart';
import '../pages/transactions/transactions/transactions.dart';
import 'theme.dart' as theme;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Manager',
      themeMode: ThemeMode.system,
      theme: theme.light,
      darkTheme: theme.dark,
      restorationScopeId: 'root',
      home: getIt.call<AuthService>.call().isSignedIn
          ? const TransactionsPageProvider()
          : const SignInPageProvider(),
    );
  }
}
