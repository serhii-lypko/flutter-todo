import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wise_repeat/shared/bloc/exports.dart';

import './widgets/exports.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    final themeOption = context.select((SettingsCubit cubit) => cubit.state.themeOption);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 32.0, 16.0, 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            ThemePicker(
              activeOption: themeOption,
              onChanged: (value) => context.read<SettingsCubit>().setTheme(value),
            ),
            const SizedBox(height: 32),
            // Font Size section
            Text(
              'Font Size',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
