import '../api/models/word_pair.dart';

import '../database/database.dart';

// each repository generally manages a single domain
// Packages in the repository layer should generally only interact with the data layer

class WordPairsRepository {
  const WordPairsRepository({
    required AppDatabase database,
  }) : _database = database;

  final AppDatabase _database;

  Stream<List<WordPair>> getWordPairs() {
    return Stream.value([]);
  }

  Future<List<WordPairItem>> testGetItemsFromDb() async {
    List<WordPairItem> allItems =
        await _database.select(_database.wordPairItems).get();

    return allItems;
  }

  Future<void> testAddItemToDb() async {
    await _database.into(_database.wordPairItems).insert(
        WordPairItemsCompanion.insert(
            left: "this is left", right: "right 2101"));

    List<WordPairItem> allItems = await testGetItemsFromDb();

    print('testAddItemToDb (after add): ');
    print(allItems);
    print("-- -- -- -- -- -- --");
  }
}
