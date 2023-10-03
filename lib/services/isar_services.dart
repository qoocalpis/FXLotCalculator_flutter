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
        [TestFavoriteCurrencyPairsListSchema, TestUserSchema],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> createUser() async {
    final isar = await db;

    final user = TestUser()..name = 'Yuki';

    final List<String> defaultPairs = ['USD/JPY', 'EUR/USD', 'GBP/JPY'];

    await isar.writeTxn(() async {
      await isar.testUsers.put(user);
      for (var pair in defaultPairs) {
        final favoriteCurrencyPair = TestFavoriteCurrencyPairsList()
          ..name = pair;
        await isar.testFavoriteCurrencyPairsLists.put(favoriteCurrencyPair);
      }
    });
  }
}


  // Future<void> createBookCategory(BookCategory newBookCategory) async {
  //   final isar = await db;
  //   isar.writeTxnSync<int>(() => isar.bookCategorys.putSync(newBookCategory));
  // }

  // Future<void> createAuthor(Author newAuthor) async {
  //   final isar = await db;
  //   isar.writeTxnSync<int>(() => isar.authors.putSync(newAuthor));
  // }

