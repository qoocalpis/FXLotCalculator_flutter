import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_http_request.dart';
import 'package:lot_size_calculator_app/models/user_model.dart';
import 'package:lot_size_calculator_app/pages/favorite_currency_pair_list_page.dart';
import 'package:lot_size_calculator_app/pages/result_lot_size_page.dart';
import 'package:lot_size_calculator_app/pages/widgets/calculation_set_cell.dart';
import 'package:lot_size_calculator_app/pages/widgets/national_flag.dart';
import 'package:lot_size_calculator_app/pages/widgets/price_text.dart';
import 'package:lot_size_calculator_app/provider/currency_pair_controller.dart';
import 'package:lot_size_calculator_app/provider/lot_size_calculator_controller.dart';
import 'package:lot_size_calculator_app/provider/main_screen_controller.dart';
import 'package:lot_size_calculator_app/provider/user_controller.dart';
import 'package:lot_size_calculator_app/services/isar_services.dart';
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
  late String selectedCurrencyPair;
  late String rate;

  @override
  void initState() {
    super.initState();
    print('LotSizeCalculatorPage');

    final mainScreenModelNotifier =
        ref.read(mainScreenModelNotifierProvider.notifier);
    Future(() async {
      mainScreenModelNotifier.setScreenTitle(widget.title);
    });
    // initialize();
  }

  @override
  Widget build(BuildContext context) {
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
    final fontSize = MediaQuery.of(context).size.height * 0.035;
    final topContainerSize = MediaQuery.of(context).size.height * 0.15;
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          Text(
                            selectedCurrencyPairRate,
                            style: TextStyle(
                              fontSize: fontSize * 0.7,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.backspace),
                            onPressed: () => {
                              // pushWithReloadByReturn(context),
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) {
                                    return const FavoriteCurrencyPairListPage();
                                  },
                                ),
                              ),
                            },
                          ),
                        ],
                      )
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
                width: MediaQuery.of(context).size.width * 0.4, //横幅
                height: MediaQuery.of(context).size.height * 0.05, //高さ
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.black,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(AppLocalizations.of(context)!.calculate),
                  onPressed: () => showModalBottomSheet(
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    // showModalBottomSheetで表示される中身
                    builder: (context) => const ResultLotSizePage(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Future<void> initialize() async {
  //   final isar = IsarService.instance;
  //   final data = await isar.fechSelectedCurrencyPair();

  //   selectedCurrencyPair = data!.pair;
  //   setState(() {});
  // }

  // void pushWithReloadByReturn(BuildContext context) async {
  //   // [*2]
  //   final result = await Navigator.push(
  //     // [*3]
  //     context,
  //     MaterialPageRoute<bool>(
  //       // [*4]
  //       builder: (BuildContext context) => const FavoriteCurrencyPairListPage(),
  //     ),
  //   );

  //   if (result!) {
  //     // [*5]
  //     setState(() {});
  //     // notifyListeners();
  //   }
  // }
}
