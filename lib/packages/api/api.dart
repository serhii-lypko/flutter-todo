import '../data_provider/models/word_pair.dart';

abstract class PersistenceApi {
  const PersistenceApi();

  Stream<List<WordPair>> getWordPairs();

  Future<void> addNote(String left, String right);
}
