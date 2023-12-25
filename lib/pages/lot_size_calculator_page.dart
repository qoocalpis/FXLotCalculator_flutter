import 'dart:math';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/models/user_model.dart';
import 'package:lot_size_calculator_app/pages/favorite_currency_pair_list_page.dart';
import 'package:lot_size_calculator_app/pages/result_lot_size_page.dart';
import 'package:lot_size_calculator_app/pages/widgets/calculation_set_cell.dart';
import 'package:lot_size_calculator_app/pages/widgets/national_flag.dart';
import 'package:lot_size_calculator_app/provider/currency_pair_controller.dart';
import 'package:lot_size_calculator_app/provider/lot_size_calculator_controller.dart';
import 'package:lot_size_calculator_app/provider/main_screen_controller.dart';
import 'package:lot_size_calculator_app/provider/user_controller.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';

class LotSizeCalculatorPage extends ConsumerStatefulWidget {
  const LotSizeCalculatorPage({
    super.key,
    required this.title,
  });
  final String title;

  @override
  LotSizeCalculatorState createState() => LotSizeCalculatorState();
}

class LotSizeCalculatorState extends ConsumerState<LotSizeCalculatorPage> {
  @override
  void initState() {
    super.initState();
    final mainScreenModelNotifier =
        ref.read(mainScreenModelNotifierProvider.notifier);
    Future(() async {
      mainScreenModelNotifier.setScreenTitle(widget.title);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
    final bool lotSizeModelIsEnable =
        ref.watch(lotSizeCalculatorModelNotifierProvider).isEnable;

    final fontSize = screenHeight * 0.035;
    final topContainerSize = screenHeight * 0.15;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                    color: Colors.green,
                  ),
                  height: topContainerSize,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: topContainerSize * 0.2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(selectedCurrencyPair,
                              style:
                                  TextStyle(fontSize: topContainerSize * 0.25)),
                          const SizedBox(width: 10),
                          selectedCurrencyPair != AppConst.strEmpty
                              ? NationalFlag(
                                  currencyPair: selectedCurrencyPair,
                                  size: fontSize,
                                )
                              : const SizedBox(
                                  width: 10,
                                )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.3,
                            child: Text(
                              AppLocalizations.of(context)!.rate,
                              style: TextStyle(fontSize: fontSize * 0.5),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.3,
                            child: Text(
                              selectedCurrencyPairRate,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: fontSize * 0.7),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.3,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                shadowColor: Colors.black,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.fact_check,
                                      size: screenWidth * 0.07),
                                  const SizedBox(width: 5),
                                  const Text('MyList'),
                                ],
                              ),
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const FavoriteCurrencyPairListPage()),
                                ).then((result) {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CalculationSetCell(
                  title: AppLocalizations.of(context)!.accountBalance,
                  type: UpdatePropertyType.accountBalance,
                  subTitle: "(${userModelProvider?.user.accountCurrency})",
                ),
                CalculationSetCell(
                  title: AppLocalizations.of(context)!.lossAllowance,
                  type: UpdatePropertyType.percent,
                  needsDefaultText: true,
                ),
                CalculationSetCell(
                  title: AppLocalizations.of(context)!.lossTolerancePips,
                  type: UpdatePropertyType.pips,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: SizedBox(
                width: screenWidth * 0.4, //横幅
                height: screenHeight * 0.05, //高さ
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          !lotSizeModelIsEnable ? Colors.grey : Colors.yellow,
                      foregroundColor: Colors.black,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(AppLocalizations.of(context)!.calculate),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      final calculatorModelNotifier = ref.read(
                          lotSizeCalculatorModelNotifierProvider.notifier);
                      calculatorModelNotifier.calculate(
                          selectedCurrencyPair, selectedCurrencyPairRate);
                      !lotSizeModelIsEnable
                          ? null
                          : showModalBottomSheet(
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              context: context,
                              // showModalBottomSheetで表示される中身
                              builder: (context) => const ResultLotSizePage(),
                            );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double? solveEquation(double p, double k) {
    // 初期値を設定
    double X = 0;

    // 収束条件や反復回数の設定
    double epsilon = 1e-6;
    int maxIterations = 1000;
    int iteration = 0;

    // 反復により方程式を解く
    while (iteration < maxIterations) {
      double nextX = p * pow(X, 1 + k) + (1 - p);

      // 収束条件を満たせば結果を返す
      if ((X - nextX).abs() < epsilon) {
        return nextX;
      }

      // 次の反復に進む
      X = nextX;
      iteration++;
    }

    // 収束しない場合はnullを返すなど、エラーハンドリングが必要です
    return null;
  }
}
