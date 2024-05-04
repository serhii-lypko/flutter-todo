import '../data_provider/models/word_pair.dart';

// TODO: better name for a folder and a file
abstract class PersistenceApi {
  const PersistenceApi();

  Stream<List<WordPair>> getWordPairs();

  Future<void> addWordPair(String left, String right);

  Future<void> deleteWordPair(int recordId);
}
