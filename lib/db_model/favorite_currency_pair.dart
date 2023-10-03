import 'package:isar/isar.dart';
import 'package:lot_size_calculator_app/db_model/user.dart';

part 'favorite_currency_pair.g.dart';

@collection
class FavoriteCurrencyPairsList {
  Id id = Isar.autoIncrement; // id = nullでも自動インクリメントされます。

  @Index(unique: true)
  late String pair;
  late bool selected;
  late bool registered;
  final user = IsarLinks<User>();
}
