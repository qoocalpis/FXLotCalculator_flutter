import 'package:isar/isar.dart';
import 'package:lot_size_calculator_app/services/db_model/user.dart';

part 'currency_pair.g.dart';

@collection
class CurrencyPair {
  Id id = Isar.autoIncrement; // id = nullでも自動インクリメントされます。

  @Index(unique: true)
  late String pair;

  late bool selected;
  late bool addedToFavorite;
  final user = IsarLinks<User>();
}
