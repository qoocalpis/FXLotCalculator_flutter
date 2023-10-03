import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:lot_size_calculator_app/db_model/favorite_currency_pair.dart';
import 'package:lot_size_calculator_app/db_model/user.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openIsar();
  }

  Future<Isar> openIsar() async {
    WidgetsFlutterBinding.ensureInitialized();
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [FavoriteCurrencyPairsListSchema, UserSchema],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  // Future<void> deleteUser() async {
  //   final isar = await db;

  //   final user = User()..lot = ;

  //   final List<String> defaultPairs = ['USD/JPY', 'EUR/USD', 'GBP/JPY'];

  //   await isar.writeTxn(() async {
  //     await isar.users.put(user);
  //     for (var pair in defaultPairs) {
  //       final favoriteCurrencyPair = FavoriteCurrencyPairsList()..name = pair;
  //       await isar.favoriteCurrencyPairsLists.put(favoriteCurrencyPair);
  //     }
  //   });
  // }

  Future<void> createUser() async {
    final isar = await db;

    final testUser = isar.users;
    final recipes2 = isar.favoriteCurrencyPairsLists;

    // final user = User()..name = 'Yuki';

    final List<String> defaultPairs = ['USD/JPY', 'EUR/USD', 'GBP/JPY'];

    final userId = await testUser.get(0);

    // //デフォルトでテーブルを作成
    // if (userId == null) {
    //   await isar.writeTxn(() async {
    //     await isar.users.put(user);
    //     for (var pair in defaultPairs) {
    //       final favoriteCurrencyPair = FavoriteCurrencyPairsList()..name = pair;
    //       await isar.favoriteCurrencyPairsLists.put(favoriteCurrencyPair);
    //     }
    //   });
    // }

    await isar.writeTxn(() async {
      final count = await testUser.deleteAll([]);
      print('We deleted $count recipes');
    });
  }

  // let array: [String] = [
  //       "AUD/CAD"
  //       ,"AUD/CHF"
  //       ,"AUD/JPY"
  //       ,"AUD/NZD"
  //       ,"AUD/USD"
  //       ,"CAD/CHF"
  //       ,"CAD/JPY"
  //       ,"CHF/JPY"
  //       ,"EUR/AUD"
  //       ,"EUR/CAD"
  //       ,"EUR/CHF"
  //       ,"EUR/GBP"
  //       ,"EUR/JPY"
  //       ,"EUR/NZD"
  //       ,"EUR/USD"
  //       ,"GBP/AUD"
  //       ,"GBP/CAD"
  //       ,"GBP/CHF"
  //       ,"GBP/JPY"
  //       ,"GBP/NZD"
  //       ,"GBP/USD"
  //       ,"NZD/CAD"
  //       ,"NZD/JPY"
  //       ,"NZD/USD"
  //       ,"USD/CAD"
  //       ,"USD/CHF"
  //       ,"USD/JPY"
  //       ,"XAU/USD"
  //   ]

  //   let defautArray: [String] = ["USD/JPY", "EUR/USD", "GBP/JPY"]
}
