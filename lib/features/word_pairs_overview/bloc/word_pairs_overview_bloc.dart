import 'package:bloc/bloc.dart';

import 'word_pairs_overview_state.dart';
import 'word_pairs_overview_event.dart';

import '../../../packages/repository/repository.dart';

import '../../../packages/data_provider/models/word_pair.dart';

class WordPairsOverviewBloc
    extends Bloc<WordPairsOverviewEvent, WordPairsOverviewState> {
  WordPairsOverviewBloc({required WordPairsRepository repository})
      : _repository = repository,
        super(const WordPairsOverviewState()) {
    on<InitialWordPairsCreated>(_initialWordPairsCreated);
    on<WordPairAdded>(_wordPairAdded);
    on<WordPairDismissed>(_wordPairDismissed);
  }

  final WordPairsRepository _repository;

  Future<void> _initialWordPairsCreated(
    InitialWordPairsCreated event,
    Emitter<WordPairsOverviewState> emit,
  ) async {
    // subscribes to a stream and maps each emitted item to a new state
    await emit.forEach<List<WordPair>>(
      _repository.getWordPairs(),
      onData: (wordPairs) => state.copyWith(
        wordPairs: wordPairs,
      ),
    );
  }

  Future<void> _wordPairAdded(
    WordPairAdded event,
    Emitter<WordPairsOverviewState> emit,
  ) async {
    await _repository.addWordPair(event.pair[0], event.pair[1]);
  }

  Future<void> _wordPairDismissed(
      WordPairDismissed event, Emitter<WordPairsOverviewState> emit) async {
    await _repository.deleteWordPair(event.recordId);
  }
}
