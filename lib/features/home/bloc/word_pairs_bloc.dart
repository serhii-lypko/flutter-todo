import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wise_repeat/shared/models/exports.dart';

part 'word_pairs_event.dart';
part 'word_pairs_state.dart';

class WordPairsBloc extends HydratedBloc<WordPairsEvent, WordPairsState> {
  WordPairsBloc() : super(const WordPairsState());

  @override
  WordPairsState fromJson(Map<String, dynamic> json) {
    return WordPairsState(
      wordPairs: (json['wordPairs'] as List).map((pair) => WordPair.fromJson(pair)).toList(),
    );
  }

  @override
  Map<String, dynamic> toJson(WordPairsState state) {
    return {
      'wordPairs': state.wordPairs.map((pair) => pair.toJson()).toList(),
    };
  }
}
