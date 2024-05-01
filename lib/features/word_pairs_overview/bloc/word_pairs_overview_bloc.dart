import 'package:bloc/bloc.dart';

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
    on<CreateInitialWordPairs>(_createInitialWordPairs);
    on<AddWordPair>(_addWordPair);
  }

  final WordPairsRepository _repository;

  void _createInitialWordPairs(
    CreateInitialWordPairs event,
    Emitter<WordPairsOverviewState> emit,
  ) {
    _repository.mockFn();

    // print("event: [_createInitialWordPairs]");

    List<WordPair> mockWordPairs = [
      WordPair(id: '1', title: 'Mock WordPair 1'),
      WordPair(id: '2', title: 'Mock WordPair 2'),
      WordPair(id: '3', title: 'Mock WordPair 3'),
    ];

    emit(state.copyWith(wordPairs: mockWordPairs));
  }

  void _addWordPair(
    AddWordPair event,
    Emitter<WordPairsOverviewState> emit,
  ) {
    // print("event: [_addWordPair]");

    int nextId = state.wordPairs.length + 1;
    WordPair newWordPair =
        WordPair(id: nextId.toString(), title: 'New Word Pair');

    emit(state.copyWith(
        wordPairs: List.from(state.wordPairs)..add(newWordPair)));
  }
}
