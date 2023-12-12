import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/models/lot_size_calculator_model.dart';
import 'package:lot_size_calculator_app/models/user_model.dart';
import 'package:lot_size_calculator_app/provider/currency_pair_controller.dart';
import 'package:lot_size_calculator_app/provider/lot_size_calculator_controller.dart';
import 'package:lot_size_calculator_app/provider/user_controller.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';

class ResultLotSizePage extends ConsumerWidget {
  const ResultLotSizePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LotSizeCalculatorModel lotSizeModel =
        ref.watch(lotSizeCalculatorModelNotifierProvider);
    final UserModel? userModelProvider =
        ref.watch(userModelNotifierProvider).when(
              loading: () => null,
              error: (e, s) => null,
              data: (d) => d,
            );
    final String selectedCurrencyPair = ref
        .watch(currencyPairModelNotifierProvider)
        .when(
          loading: () => AppConst.strEmpty,
          error: (e, s) => AppConst.strEmpty,
          data: (d) =>
              d.firstWhere((element) => element.selected == true).currencyPair,
        );
    final String selectedCurrencyPairRate = ref
        .watch(currencyPairModelNotifierProvider)
        .when(
          loading: () => AppConst.loadingText,
          error: (e, s) => AppConst.errorText,
          data: (d) => d.firstWhere((element) => element.selected == true).rate,
        );
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              icon: const Icon(
                Icons.close,
                color: Color.fromARGB(255, 64, 128, 255),
                size: 35,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "適正ロット",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  " Lots",
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                buildRow("証拠金", '${lotSizeModel.accountBalance}'),
                buildRow("損失許容額(円)", "円"),
                buildRow("損失許容額(%)", "${lotSizeModel.percent}%"),
                buildRow("ストップロス", "${lotSizeModel.pips}pips"),
                buildRow("通貨ペア", selectedCurrencyPair),
                buildRow("レート", selectedCurrencyPairRate),
                buildRow("1 ロット", "${userModelProvider!.user.lot}"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(
        12.0,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
