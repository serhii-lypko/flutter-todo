import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import '../../objectbox.g.dart';

import './models/word_pair.dart';

import '../api/api.dart';

class ObjectBox {
  ObjectBox();

  late final Store store;
  late final Box<WordPair> _wordPairBox;

  ObjectBox._create(this.store) {
    _wordPairBox = Box<WordPair>(store);
  }

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "obx-db"));

    return ObjectBox._create(store);
  }
}

class DatabaseProvider extends PersistenceApi {
  DatabaseProvider({
    required ObjectBox objectBoxStore,
  }) : _objectBoxStore = objectBoxStore;

  final ObjectBox _objectBoxStore;

  @override
  Stream<List<WordPair>> getWordPairs() {
    final builder = _objectBoxStore._wordPairBox.query();

    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  @override
  Future<void> addNote(String left, String right) =>
      _objectBoxStore._wordPairBox.putAsync(WordPair(left, right));
}
