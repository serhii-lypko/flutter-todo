import '../data_provider/models.dart';
import '../data_provider/database_provider.dart';

class WordPairsRepository {
  WordPairsRepository({
    required ObjectBoxDBProvider dbProvider,
  }) : _dbProvider = dbProvider;

  final ObjectBoxDBProvider _dbProvider;

  Stream<List<WordPair>> getWordPairs() {
    final builder = _dbProvider.wordPairBox.query();

    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  Future<void> addWordPair(String left, String right) =>
      _dbProvider.wordPairBox.putAsync(WordPair(left, right));

  Future<void> deleteWordPair(int recordId) =>
      _dbProvider.wordPairBox.removeAsync(recordId);
}
