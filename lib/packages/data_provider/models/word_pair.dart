import 'package:objectbox/objectbox.dart';

@Entity()
class WordPair {
  @Id()
  int id = 0;

  String left;
  String right;

  WordPair(this.left, this.right);
}
