import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/injectable.dart';
import '../../domain/repositories/auth_service.dart';
import '../pages/navbar/navbar.dart';
import '../pages/sign_in/sign_in.dart';
import '../pages/core/transactions_cubit/transactions_cubit.dart';
import 'theme.dart' as theme;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TransactionsCubit>(),
      child: MaterialApp(
        title: 'Money Manager',
        themeMode: ThemeMode.system,
        theme: theme.light,
        darkTheme: theme.dark,
        restorationScopeId: 'root',
        home: getIt.call<AuthService>.call().isSignedIn
            ? const NavBarPage()
            : const SignInPageProvider(),
      ),
    );
  }
}
