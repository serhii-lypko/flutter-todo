import 'package:objectbox/objectbox.dart';

@Entity()
class WordPair {
  @Id()
  int id = 0;

  String left;
  String right;

  WordPair(this.left, this.right);
}

@Entity()
class UserSettings {
  @Id()
  int id = 0;

  // TODO: enum
  bool darkMode;

  UserSettings({required this.darkMode});
}
