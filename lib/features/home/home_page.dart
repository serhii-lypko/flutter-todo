import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wise_repeat/features/exports.dart';
import 'package:wise_repeat/shared/models/word_pair.dart';
import 'package:wise_repeat/shared/widgets/exports.dart';

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
                        onDismissed: (_) {
                          BlocProvider.of<WordPairsBloc>(context)
                              .add(WordPairDismissed(wordPair.id));
                        },
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
            final bloc = BlocProvider.of<WordPairsBloc>(context);

            final TextEditingController leftController = TextEditingController();
            final TextEditingController rightController = TextEditingController();

            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text(
                                'Add Word Pair',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 60),
                              CustomTextField(controller: leftController, placeholder: 'Left'),
                              const SizedBox(height: 20),
                              CustomTextField(controller: rightController, placeholder: 'Right'),
                              const SizedBox(height: 20),
                              TextButton(
                                child: const Text(
                                  'Add Word Pair',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                onPressed: () {
                                  final leftWord = leftController.text;
                                  final rightWord = rightController.text;

                                  bloc.add(
                                      WordPairAdded(WordPair(left: leftWord, right: rightWord)));
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );

            //
          },
        ));
  }
}
