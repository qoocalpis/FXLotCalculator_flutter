import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement; // id = nullでも自動インクリメントされます。

  String? name;

  int? age;
}
