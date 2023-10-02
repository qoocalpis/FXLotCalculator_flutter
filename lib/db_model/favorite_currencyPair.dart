import 'package:isar/isar.dart';
import 'package:lot_size_calculator_app/db_model/user.dart';

part 'favorite_currencyPair.g.dart';

@collection
class FavoriteCurrencyPairsList {
  Id id = Isar.autoIncrement; // id = nullでも自動インクリメントされます。

  final favoriteCurrencyPairsList = IsarLink<User>();
  String? name;

  int? age;
}
