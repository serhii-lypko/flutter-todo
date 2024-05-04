import '../data_provider/models/word_pair.dart';

import '../api/api.dart';

// The repository layer is a wrapper around one or more data providers
// with which the Bloc Layer communicates.

// each repository generally manages a single domain
// Packages in the repository layer should generally only interact with the data layer

// the repository layer should be able to interact with multiple data providers
// and perform transformations on the data before handing the result to the business logic layer

// TODO: more specific name for a folder and a file

class WordPairsRepository {
  const WordPairsRepository({
    required PersistenceApi persistenceApi,
  }) : _persistenceApi = persistenceApi;

  final PersistenceApi _persistenceApi;

  Stream<List<WordPair>> getWordPairs() {
    return _persistenceApi.getWordPairs();
  }

  Future<void> addWordPair(String left, String right) async {
    await _persistenceApi.addWordPair(left, right);
  }

  Future<void> deleteWordPair(int recordId) async {
    await _persistenceApi.deleteWordPair(recordId);
  }
}
