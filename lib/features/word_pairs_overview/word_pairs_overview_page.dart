import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/word_pairs_overview_bloc.dart';
import 'bloc/word_pairs_overview_event.dart';
import 'bloc/word_pairs_overview_state.dart';

import '../../packages/repository/repository.dart';

import 'widgets/word_pair_tile.dart';
import '../../shared/shared.dart';

class WordPairsOverviewPage extends StatelessWidget {
  static const routeName = '/word-pairs-overview';

  const WordPairsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WordPairsOverviewBloc(repository: context.read<WordPairsRepository>())
            ..add(const InitialWordPairsCreated()),
      child: const WordPairsOverviewView(),
    );
  }
}

class WordPairsOverviewView extends StatelessWidget {
  const WordPairsOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Word Pairs Overview"),
          actions: const [],
        ),
        body: BlocBuilder<WordPairsOverviewBloc, WordPairsOverviewState>(
          builder: (context, state) {
            return CupertinoScrollbar(
              child: ListView(
                children: [
                  for (final wordPair in state.wordPairs)
                    WordPairListTile(
                      wordPair: wordPair,
                      onDismissed: (_) {},
                      onTap: () {},
                    ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
          onPressed: () {
            final bloc = BlocProvider.of<WordPairsOverviewBloc>(context);

            final TextEditingController leftController =
                TextEditingController();
            final TextEditingController rightController =
                TextEditingController();

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
                              CustomTextField(
                                  controller: leftController,
                                  placeholder: 'Left'),
                              const SizedBox(height: 20),
                              CustomTextField(
                                  controller: rightController,
                                  placeholder: 'Right'),
                              const SizedBox(height: 20),
                              TextButton(
                                child: const Text(
                                  'Add Word Pair',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  final leftWord = leftController.text;
                                  final rightWord = rightController.text;

                                  bloc.add(
                                      WordPairAdded([leftWord, rightWord]));
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
          },
        ));
  }
}
