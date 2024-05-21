part of 'word_pairs_bloc.dart';

class WordPairsEvent extends Equatable {
  const WordPairsEvent();

  @override
  List<Object> get props => [];
}

final class WordPairAdded extends WordPairsEvent {
  const WordPairAdded(this.pair);

  final WordPair pair;

  @override
  List<Object> get props => [pair];
}

final class WordPairDismissed extends WordPairsEvent {
  const WordPairDismissed(this.recordId);

  final String recordId;

  @override
  List<Object> get props => [recordId];
}
