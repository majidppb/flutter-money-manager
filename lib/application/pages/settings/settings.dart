import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injectable.dart';
import '../../core/styles.dart';
import '../sign_in/sign_in.dart';
import 'cubit/settings_cubit.dart';

class SettingsProvider extends StatelessWidget {
  const SettingsProvider({super.key});

  static const icon =
      Hero(tag: 'settings', child: Icon(Icons.settings_rounded));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SettingsCubit>(),
      child: const _SettingsPage(),
    );
  }
}

class _SettingsPage extends StatelessWidget {
  const _SettingsPage();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SettingsCubit>().getUser();
      context.read<SettingsCubit>().getSummary();
    });

    return BlocListener<SettingsCubit, SettingsState>(
      listener: _onSignOutUpdates,
      child: Scaffold(
        appBar: AppBar(
          leading: SettingsProvider.icon,
          title: const Text('Settings'),
        ),
        body: BlocBuilder<SettingsCubit, SettingsState>(
          // buildWhen: (previous, current) =>
          //     current.status == SettingsStatus.initial ||
          //     current.status == SettingsStatus.loaded,
          builder: (context, state) {
            if (state.status == SettingsStatus.initial) {
              return const SizedBox();
            }
            return SafeArea(
                top: false,
                minimum: kScaffoldHPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              state.user.name,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(state.user.email),
                          ],
                        ),
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: state.user.photo != null
                              ? NetworkImage(state.user.photo!)
                              : null,
                        )
                      ],
                    ),
                    kHeight50,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Day'),
                        Text(state.summary.day.toInt().toString()),
                      ],
                    ),
                    kHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Week'),
                        Text(state.summary.week.toInt().toString()),
                      ],
                    ),
                    kHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Month'),
                        Text(state.summary.month.toInt().toString()),
                      ],
                    ),
                    kHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total'),
                        Text(state.summary.total.toInt().toString()),
                      ],
                    ),
                    const Spacer(),
                    Center(
                      child: MaterialButton(
                        minWidth: 350,
                        height: 50,
                        color: Colors.red,
                        onPressed: () => _onSignOut(context),
                        child: const Text('Sign out'),
                      ),
                    ),
                    kHeight50,
                  ],
                ));
          },
        ),
      ),
    );
  }
}

void _onSignOutUpdates(BuildContext context, SettingsState state) {
  if (state.status == SettingsStatus.signOutSuccess) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const SignInPageProvider()),
        (route) => false);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('You are signed out.'),
      ),
    );
  }
  if (state.status == SettingsStatus.signOutError) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Oops! Signing out failed.'),
        backgroundColor: Colors.red,
      ),
    );
  }
}

void _onSignOut(BuildContext context) async {
  showAdaptiveDialog(
    context: context,
    builder: (ctx) => AlertDialog.adaptive(
      title: const Text('Are You Sure ?'),
      actions: [
        TextButton(
          onPressed: Navigator.of(ctx).pop,
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: context.read<SettingsCubit>().signOut,
          child: const Text('Sign out'),
        )
      ],
    ),
  );
}
