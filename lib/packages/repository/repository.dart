import '../api/models/word_pair.dart';

// each repository generally manages a single domain
// Packages in the repository layer should generally only interact with the data layer

class WordPairsRepository {
  const WordPairsRepository();

  Stream<List<WordPair>> getWordPairs() {
    return Stream.value([]);
  }

  void mockFn() {
    print("----- [] ----- repository mock fn");
  }
}
