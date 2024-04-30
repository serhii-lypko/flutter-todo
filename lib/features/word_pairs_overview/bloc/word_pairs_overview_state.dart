import 'package:equatable/equatable.dart';

import '../models/word_pair.dart';

final class WordPairsOverviewState extends Equatable {
  const WordPairsOverviewState({
    this.wordPairs = const [],
  });

  final List<WordPair> wordPairs;

  WordPairsOverviewState copyWith({
    List<WordPair>? wordPairs,
  }) {
    return WordPairsOverviewState(
      wordPairs: wordPairs ?? this.wordPairs,
    );
  }

  @override
  List<Object?> get props => [wordPairs];
}
