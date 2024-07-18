import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injectable.dart';
import '../../core/styles.dart';
import '../navbar/navbar.dart';
import 'cubit/sign_in_cubit.dart';

class SignInPageProvider extends StatelessWidget {
  const SignInPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignInCubit>(),
      child: const _SignInPage(),
    );
  }
}

class _SignInPage extends StatelessWidget {
  const _SignInPage();

  void _onStateChange(BuildContext context, SignInState state) {
    if (state is Success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You are successfully signed in.'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const NavBarPage()));
    } else if (state is Error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Oops! Signing in failed.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: _onStateChange,
      child: Scaffold(
        body: SafeArea(
          minimum: kScaffoldHPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Money Manager !',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 300),
              Text(
                'Sign in to your account',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              kHeight50,
              Center(
                child: MaterialButton(
                  minWidth: 350,
                  height: 50,
                  color: Colors.red,
                  onPressed: context.read<SignInCubit>().signIn,
                  child: const Text('Sign in with Google'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
