import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  @Index(unique: true)
  Id id = 0; //固定
  late int lot;
  late String pair;
  late int percent;
  late String accountCurrency;
}
