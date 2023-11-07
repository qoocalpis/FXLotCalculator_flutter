import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:lot_size_calculator_app/models/user_model.dart';
import 'package:lot_size_calculator_app/services/db_model/currency_pair.dart';
import 'package:lot_size_calculator_app/services/db_model/user.dart';
import 'package:lot_size_calculator_app/services/google_sheet_services.dart';
import 'package:lot_size_calculator_app/utils/setting_constants.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;

  IsarService._() {
    print('IsarService()');

    db = openIsar();
  }

  static final instance = IsarService._();

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

  Future<void> createUser(List<GoogleSheetAPIModel> modelList) async {
    print('IsarService().createUser()');

    final isar = await db;
    final userId = await isar.users.get(0);

    //デフォルトでUser,CurrencyPairコレクションにObjectを挿入
    if (userId == null) {
      const defaultPairs = [
        'USD/JPY',
        'EUR/USD',
        'GBP/JPY',
      ];

      final user = User()
        ..pair = 'USD/JPY'
        ..lot = 100000
        ..percent = 5
        ..accountCurrency = 'USD';

      await isar.writeTxn(() async {
        await isar.users.put(user);

        for (var model in modelList) {
          if (defaultPairs.contains(model.currencyPair)) {
            if (model.currencyPair == 'USD/JPY') {
              final currencyPair = CurrencyPair()
                ..pair = model.currencyPair
                ..selected = true
                ..addedToFavorite = true;
              await isar.currencyPairs.put(currencyPair);
            } else {
              final currencyPair = CurrencyPair()
                ..pair = model.currencyPair
                ..selected = false
                ..addedToFavorite = true;
              await isar.currencyPairs.put(currencyPair);
            }
          } else {
            final currencyPair = CurrencyPair()
              ..pair = model.currencyPair
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

  Future<void> changedData(int index, List<String> items) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        final user = await isar.users.get(0);
        if (user != null) {
          if (items == SettingConst.accountCurrencys) {
            user.accountCurrency = items[index];
          }
          if (items == SettingConst.constractSizes) {
            user.lot = int.parse(items[index]);
          }
          if (items == SettingConst.percentList) {
            user.percent = int.parse(items[index]);
          }
          await isar.users.put(user); // 更新操作の実行
        }
      },
    );
  }
}
