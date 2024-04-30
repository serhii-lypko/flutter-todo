import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/word_pairs_overview_bloc.dart';
import 'bloc/word_pairs_overview_event.dart';
import 'bloc/word_pairs_overview_state.dart';

// TODO: centralized logger on the app level

class WordPairsOverviewPage extends StatelessWidget {
  static const routeName = '/word-pairs-overview';

  const WordPairsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WordPairsOverviewBloc()..add(const CreateInitialWordPairs()),
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
            print("--------------------");
            print("state on page view: ");
            print(state.wordPairs);
            print("--------------------");

            return CupertinoScrollbar(
              child: ListView(
                children: [],
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
            BlocProvider.of<WordPairsOverviewBloc>(context)
                .add(const AddWordPair());
          },
        ));
  }
}
