import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:lot_size_calculator_app/models/user_model.dart';
import 'package:lot_size_calculator_app/services/db_model/currency_pair.dart';
import 'package:lot_size_calculator_app/services/db_model/user.dart';
import 'package:lot_size_calculator_app/services/google_sheet_service.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';
import 'package:lot_size_calculator_app/utils/setting_constants.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;

  IsarService._() {
    print('IsarService()');

    db = openIsar();
  }

  static final instance = IsarService._();

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
        ..uid = AppConst.strEmpty
        ..userAuthType = AppConst.strEmpty
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

  Future<void> saveUid(String uid, String type) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        final user = await isar.users.get(0);
        if (user != null) {
          user.uid = uid;
          user.userAuthType = type;
          await isar.users.put(user); // 更新操作の実行
        }
      },
    );
  }

  Future<String> fetchUid() async {
    final isar = await db;
    final user = await isar.users.get(0);
    return user!.uid;
  }

  Future<bool> changedAddedFavorite(String targetCurrencyPair) async {
    final isar = await db;

    final currencyPair = await isar.currencyPairs
        .filter()
        .pairEqualTo(targetCurrencyPair)
        .findFirst();

    final favoriteCurrencyPairs = await isar.currencyPairs
        .filter()
        .addedToFavoriteEqualTo(true)
        .findAll();
    if (favoriteCurrencyPairs.length == 1 &&
        favoriteCurrencyPairs.first.pair == currencyPair!.pair) {
      return false;
    }

    if (!currencyPair!.addedToFavorite) {
      currencyPair.addedToFavorite = true;
    } else {
      if (currencyPair.selected) {
        final nextSlectedCurrencyPair = await isar.currencyPairs
            .filter()
            .addedToFavoriteEqualTo(true)
            .selectedEqualTo(false)
            .not()
            .pairEqualTo(currencyPair.pair)
            .findFirst();
        await changedSelected(nextSlectedCurrencyPair!.pair, true);

        currencyPair.addedToFavorite = false;
        currencyPair.selected = false;
      } else {
        currencyPair.addedToFavorite = false;
      }
    }
    await isar.writeTxn(
      () async {
        await isar.currencyPairs.put(currencyPair); // 更新操作の実行
      },
    );
    return true;
  }

  Future<String> fechAccountCurrency() async {
    final isar = await db;
    final User? user = await isar.users.get(0);
    return user!.accountCurrency;
  }

  Future<int> fechPercent() async {
    final isar = await db;
    final User? user = await isar.users.get(0);
    return user!.percent;
  }

  Future<int> fechLot() async {
    final isar = await db;
    final User? user = await isar.users.get(0);
    return user!.lot;
  }

  Future<List<CurrencyPair>> fechFavoriteCurrencyPairList() async {
    final isar = await db;
    final List<CurrencyPair> currencyPairs = await isar.currencyPairs
        .filter()
        .addedToFavoriteEqualTo(true)
        .findAll();
    return currencyPairs;
  }

  Future<List<CurrencyPair>> fechCurrencyPairList() async {
    final isar = await db;
    final List<CurrencyPair> currencyPairs =
        await isar.currencyPairs.where().findAll();
    return currencyPairs;
  }

  Future<void> changedSelected(String currencyPair, bool result) async {
    final isar = await db;
    var targetCurrencyPairfrom =
        await isar.currencyPairs.filter().selectedEqualTo(true).findFirst();
    var targetCurrencyPairTo =
        await isar.currencyPairs.filter().pairEqualTo(currencyPair).findFirst();

    if (targetCurrencyPairTo?.pair == targetCurrencyPairfrom?.pair) {
      return;
    }
    await isar.writeTxn(
      () async {
        targetCurrencyPairfrom?.selected = false;
        targetCurrencyPairTo?.selected = result;
        await isar.currencyPairs.put(targetCurrencyPairTo!); // 更新操作の実行
        await isar.currencyPairs.put(targetCurrencyPairfrom!); // 更新操作の実行
      },
    );
  }

  Future<CurrencyPair?> fechSelectedCurrencyPair() async {
    final isar = await db;
    final CurrencyPair? currencyPair =
        await isar.currencyPairs.filter().selectedEqualTo(true).findFirst();
    return currencyPair;
  }
}
