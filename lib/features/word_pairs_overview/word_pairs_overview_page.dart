import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/word_pairs_overview_bloc.dart';
import 'bloc/word_pairs_overview_event.dart';
import 'bloc/word_pairs_overview_state.dart';

import '../../packages/repository/repository.dart';

import 'widgets/word_pair_tile.dart';

class WordPairsOverviewPage extends StatelessWidget {
  static const routeName = '/word-pairs-overview';

  const WordPairsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WordPairsOverviewBloc(repository: context.read<WordPairsRepository>())
            ..add(const CreateInitialWordPairs()),
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

            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Center(
                    child: TextButton(
                      child: Text('Add Word Pair'),
                      onPressed: () {
                        bloc.add(const AddWordPair());
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );
              },
            );
          },
        )

        // -- -- Full screen option -- --
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Colors.white,
        //   shape: const CircleBorder(),
        //   child: const Icon(
        //     Icons.add,
        //     color: Colors.black,
        //   ),
        //   onPressed: () {
        //     showModalBottomSheet(
        //       context: context,
        //       isScrollControlled:
        //           true, // Allow the modal to take up the entire screen
        //       builder: (context) {
        //         return Container(
        //           height: MediaQuery.of(context)
        //               .size
        //               .height, // Set the height of the modal to the height of the screen
        //           child: Center(
        //             child: TextButton(
        //               child: Text('Add Word Pair'),
        //               onPressed: () {
        //                 BlocProvider.of<WordPairsOverviewBloc>(context)
        //                     .add(const AddWordPair());
        //                 Navigator.pop(context); // Close the modal
        //               },
        //             ),
        //           ),
        //         );
        //       },
        //     );
        //   },
        // )

        //
        );
  }
}
