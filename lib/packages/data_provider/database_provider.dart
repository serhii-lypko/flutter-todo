import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import '../../objectbox.g.dart';

import 'models.dart';

class ObjectBoxDBProvider {
  ObjectBoxDBProvider();

  late final Store store;
  late final Box<WordPair> wordPairBox;

  ObjectBoxDBProvider._create(this.store) {
    wordPairBox = Box<WordPair>(store);
  }

  static Future<ObjectBoxDBProvider> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "obx-db"));

    return ObjectBoxDBProvider._create(store);
  }
}
