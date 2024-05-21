import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wise_repeat/features/exports.dart';

import './bloc/word_pairs_bloc.dart';
import './widgets/exports.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WordPairsBloc(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Wise Repeat"),
          actions: [
            TodosOverviewFilterButton(),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const SettingsPage();
                  },
                ));
              },
            )
          ],
        ),
        body: CupertinoScrollbar(
          child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: BlocBuilder<WordPairsBloc, WordPairsState>(builder: (context, state) {
                if (state.wordPairs.isEmpty) {
                  return Center(
                    child: Text(
                      "No word pairs yet",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  );
                }

                return ListView(
                  children: [
                    for (final wordPair in state.wordPairs)
                      WordPairListTile(
                        wordPair: wordPair,
                        onDismissed: (_) {},
                        onTap: () {},
                      ),
                  ],
                );
              })),
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
