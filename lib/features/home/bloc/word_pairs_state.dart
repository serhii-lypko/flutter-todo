part of 'word_pairs_bloc.dart';

final class WordPairsState extends Equatable {
  const WordPairsState({
    this.wordPairs = const [],
  });

  final List<WordPair> wordPairs;

  WordPairsState copyWith({
    List<WordPair> Function()? wordPairs,
  }) {
    return WordPairsState(
      wordPairs: wordPairs != null ? wordPairs() : this.wordPairs,
    );
  }

  @override
  List<Object?> get props => [
        wordPairs,
      ];
}
