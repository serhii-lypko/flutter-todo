import 'package:equatable/equatable.dart';

sealed class WordPairsOverviewEvent extends Equatable {
  const WordPairsOverviewEvent();

  @override
  List<Object> get props => [];
}

final class InitialWordPairsCreated extends WordPairsOverviewEvent {
  const InitialWordPairsCreated();
}

final class WordPairAdded extends WordPairsOverviewEvent {
  const WordPairAdded(this.pair);

  final List<String> pair;

  @override
  List<Object> get props => [pair];
}
