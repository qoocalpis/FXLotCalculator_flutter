import 'package:lot_size_calculator_app/models/currency_pair_model.dart';
import 'package:lot_size_calculator_app/services/google_sheet_services.dart';
import 'package:lot_size_calculator_app/services/isar_services.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'currency_pair_controller.g.dart';

@Riverpod(keepAlive: true)
class CurrencyPairModelNotifier extends _$CurrencyPairModelNotifier {
  final googleSheetService = GoogleSheetService.instance;
  final isarService = IsarService.instance;

  @override
  Future<List<CurrencyPairModel>?> build() async {
    final list = googleSheetService.list;
    final d = await isarService.fecthDatabase();
    if (list.isEmpty || d.currencyPais.isEmpty) return null;

    List<CurrencyPairModel> modelList = [];
    for (var item in list) {
      final index =
          d.currencyPais.indexWhere((para) => para.pair == item.currencyPair);
      if (index != -1) {
        final doubleRate = double.tryParse(item.rate);
        final currency =
            item.currencyPair.substring(item.currencyPair.length - 3);
        var rate = AppConst.strEmpty;
        if (doubleRate != null) {
          if (item.currencyPair == "XAU/USD") {
            rate = doubleRate.toStringAsFixed(2);
          } else {
            switch (currency) {
              case "JPY":
                rate = doubleRate.toStringAsFixed(3);
              default:
                rate = doubleRate.toStringAsFixed(5);
            }
          }
        }
        modelList.add(CurrencyPairModel(
          currencyPair: item.currencyPair,
          rate: rate,
          currencyCode: item.currencyCode,
          selected: d.currencyPais[index].selected,
          addedToFavorite: d.currencyPais[index].addedToFavorite,
        ));

        print(index);
        print(item.currencyPair);
        print(rate);
        print(d.currencyPais[index].selected);
        print(d.currencyPais[index].addedToFavorite);
      } else {
        print("データなし");
      }
    }
    return modelList;
  }
}
