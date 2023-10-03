import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class TestUser {
  @Index(unique: true)
  Id id = 0; // id = nullでも自動インクリメントされます。
  late String name;
}
