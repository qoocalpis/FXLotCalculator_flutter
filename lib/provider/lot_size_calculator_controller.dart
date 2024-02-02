import 'package:flutter/foundation.dart';
import 'package:lot_size_calculator_app/models/lot_size_calculator_model.dart';
import 'package:lot_size_calculator_app/services/google_sheet_service.dart';
import 'package:lot_size_calculator_app/services/isar_service.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lot_size_calculator_controller.g.dart';

enum UpdatePropertyType {
  accountBalance,
  percent,
  pips,
}

@Riverpod(keepAlive: true)
class LotSizeCalculatorModelNotifier extends _$LotSizeCalculatorModelNotifier {
  @override
  LotSizeCalculatorModel build() => const LotSizeCalculatorModel();

  void updateProperty(String text, UpdatePropertyType type) async {
    final value = int.tryParse(text);
    if (value != null) {
      switch (type) {
        case UpdatePropertyType.accountBalance:
          state = state.copyWith(accountBalance: value);
          break;
        case UpdatePropertyType.percent:
          state = state.copyWith(percent: value);
          break;
        case UpdatePropertyType.pips:
          state = state.copyWith(pips: value);
          break;
      }
    }
    print(state.accountBalance);
    state = state.copyWith(isEnable: checkProperty() ? true : false);
  }

  bool checkProperty() {
    final b1 = state.accountBalance > AppConst.zero;
    final b2 = state.percent > AppConst.zero;
    final b3 = state.pips > AppConst.zero;
    return b1 && b2 && b3;
  }

  void calculate(String pair, String rate) async {
    if (!checkProperty()) {
      return;
    }
    final isarService = IsarService.instance;
    final accountCurrency = await isarService.fechAccountCurrency();
    final accountBalance = state.accountBalance;
    final percent = state.percent;
    final oneLot = await isarService.fechLot();
    final pips = state.pips;

    final lossAllowableAmount = accountBalance * percent / 100;
    var baseRate = AppConst.doubleZero;
    final endCurrency = pair.substring(pair.length - 3, pair.length);
    final list = GoogleSheetService.instance.list;

    final firstCurrencyPair = list
        .where((e) => e.currencyCode == '$endCurrency$accountCurrency')
        .firstOrNull;

    //決済通貨が口座通貨と同じの場合
    if (endCurrency == accountCurrency) {
      baseRate = 1;
      //決済通貨が口座通貨と違う場合
    } else {
      if (accountCurrency == 'JPY') {
        if (firstCurrencyPair != null) {
          baseRate = double.parse(firstCurrencyPair.rate) * 0.01;
        } else {
          if (kDebugMode) {
            print('レートが算出できませんでした');
          }
          return;
        }
      }
      if (accountCurrency == 'USD') {
        if (firstCurrencyPair != null) {
          baseRate = double.parse(firstCurrencyPair.rate);
        } else {
          final secondCurrencyPair = list
              .where((e) => e.currencyCode == '$accountCurrency$endCurrency')
              .firstOrNull;
          if (secondCurrencyPair != null) {
            baseRate = 1 /
                double.parse(secondCurrencyPair.rate) *
                (endCurrency == 'JPY' ? 100 : 1);
          } else {
            if (kDebugMode) {
              print('レートが算出できませんでした');
            }
            return;
          }
        }
      }
    }
    switch (oneLot) {
      case 1000:
        baseRate *= 10;
        break;
      case 10000:
        baseRate *= 100;
        break;
      default:
        baseRate *= 1000;
        break;
    }
    late double result;
    result = lossAllowableAmount / pips / baseRate;
    if (oneLot == 5000) {
      result *= 0.05;
    }
    if (oneLot == 50000) {
      result *= 0.5;
    }
    if (accountCurrency == 'USD' && pair != "XAU/USD") {
      result *= 100;
    }
    // 数値を四捨五入して小数点第2位までにフォーマット
    String formattedValue = result.toStringAsFixed(2);
    state = state.copyWith(
        lossAllowableAmount: lossAllowableAmount.toInt(),
        lotSize: formattedValue);
    // 2の3乗を計算
  }
}
