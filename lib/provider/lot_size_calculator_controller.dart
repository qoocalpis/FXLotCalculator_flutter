import 'package:lot_size_calculator_app/models/lot_size_calculator_model.dart';
import 'package:lot_size_calculator_app/services/isar_services.dart';
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
    final isarService = IsarService.instance;
    state = state.copyWith(
      accountCurrency: await isarService.fechAccountCurrency(),
      lot: await isarService.fechLot(),
    );
    print(state.accountBalance);
    state = state.copyWith(isEnable: checkProperty() ? true : false);
  }

  bool checkProperty() {
    final b1 = state.accountBalance > AppConst.zero;
    final b2 = state.accountCurrency.isNotEmpty;
    final b3 = state.lot > AppConst.zero;
    final b4 = state.percent > AppConst.zero;
    final b5 = state.pips > AppConst.zero;
    return b1 && b2 && b3 && b4 && b5;
  }
}
