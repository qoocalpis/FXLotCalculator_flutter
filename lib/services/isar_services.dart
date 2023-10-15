import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:lot_size_calculator_app/models/currency_pair_object.dart';
import 'package:lot_size_calculator_app/models/user_model.dart';
import 'package:lot_size_calculator_app/services/db_model/currency_pair.dart';
import 'package:lot_size_calculator_app/services/db_model/user.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    print('IsarService()');

    db = openIsar();
    createUser();
  }

  get recipes => null;

  Future<Isar> openIsar() async {
    WidgetsFlutterBinding.ensureInitialized();
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [CurrencyPairSchema, UserSchema],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> createUser() async {
    print('IsarService().createUser()');

    final isar = await db;
    final userId = await isar.users.get(0);

    //デフォルトでUser,CurrencyPairコレクションにObjectを挿入
    if (userId == null) {
      final currencyPairObject = CurrencyPairObject();
      final currencyPairsList = currencyPairObject.currencyPairList;
      final defaultPairs = currencyPairObject.defaultPairList;

      final user = User()
        ..pair = 'USD/JPY'
        ..lot = 100000
        ..percent = 5
        ..accountCurrency = 'USD';

      await isar.writeTxn(() async {
        await isar.users.put(user);

        for (var pair in currencyPairsList) {
          if (defaultPairs.contains(pair)) {
            if (pair == 'USD/JPY') {
              final currencyPair = CurrencyPair()
                ..pair = pair
                ..selected = true
                ..addedToFavorite = true;
              await isar.currencyPairs.put(currencyPair);
            } else {
              final currencyPair = CurrencyPair()
                ..pair = pair
                ..selected = false
                ..addedToFavorite = true;
              await isar.currencyPairs.put(currencyPair);
            }
          } else {
            final currencyPair = CurrencyPair()
              ..pair = pair
              ..selected = false
              ..addedToFavorite = false;
            await isar.currencyPairs.put(currencyPair);
          }
        }
      });
    }
  }

  Future<UserModel> fecthDatabase() async {
    final isar = await db;
    final User? user = await isar.users.get(0);
    final List<CurrencyPair> currencyPairs =
        await isar.currencyPairs.where().findAll();

    final UserModel model = UserModel(user: user!, currencyPais: currencyPairs);
    return model;
  }
}
