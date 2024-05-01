import 'package:bloc/bloc.dart';
import 'package:uuid/uuid.dart';

import 'word_pairs_overview_state.dart';
import 'word_pairs_overview_event.dart';

import '../../../packages/api/models/word_pair.dart';
import '../../../packages/repository/repository.dart';

// Blocs should never directly emit new states. Instead every state change
// must be output in response to an incoming event within an EventHandler.
class WordPairsOverviewBloc
    extends Bloc<WordPairsOverviewEvent, WordPairsOverviewState> {
  WordPairsOverviewBloc({required WordPairsRepository repository})
      : _repository = repository,
        super(const WordPairsOverviewState()) {
    on<InitialWordPairsCreated>(_initialWordPairsCreated);
    on<WordPairAdded>(_wordPairAdded);
  }

  final WordPairsRepository _repository;

  void _initialWordPairsCreated(
    InitialWordPairsCreated event,
    Emitter<WordPairsOverviewState> emit,
  ) {
    _repository.mockFn();

    List<WordPair> mockWordPairs = [
      WordPair(id: '1', left: 'Left 1', right: 'Right 1'),
      WordPair(id: '2', left: 'Left 2', right: 'Right 2'),
      WordPair(id: '3', left: 'Left 3', right: 'Right 3'),
    ];

    emit(state.copyWith(wordPairs: mockWordPairs));
  }

  void _wordPairAdded(
    WordPairAdded event,
    Emitter<WordPairsOverviewState> emit,
  ) {
    const uuid = Uuid();
    String id = uuid.v4();

    WordPair newWordPair =
        WordPair(id: id, left: event.pair[0], right: event.pair[1]);

    emit(state.copyWith(
        wordPairs: List.from(state.wordPairs)..add(newWordPair)));
  }
}
