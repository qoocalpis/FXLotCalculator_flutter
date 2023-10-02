import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class TestUser {
  Id id = Isar.autoIncrement; // id = nullでも自動インクリメントされます。

  late String name;
}
