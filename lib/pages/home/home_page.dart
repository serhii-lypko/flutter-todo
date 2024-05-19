import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/word_pair_tile.dart';

import 'widgets/filter_button.dart';
import 'widgets/settings_link_button.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Wise Repeat"),
          actions: const [
            // FIXME
            TodosOverviewFilterButton(),
            SettingsLinkButton(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
          onPressed: () {
            final TextEditingController leftController = TextEditingController();
            final TextEditingController rightController = TextEditingController();

            //
          },
        ));
  }
}
