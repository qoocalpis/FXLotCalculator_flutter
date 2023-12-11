import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/models/user_model.dart';
import 'package:lot_size_calculator_app/pages/favorite_currency_pair_list_page.dart';
import 'package:lot_size_calculator_app/pages/result_lot_size_page.dart';
import 'package:lot_size_calculator_app/pages/widgets/calculation_set_cell.dart';
import 'package:lot_size_calculator_app/pages/widgets/national_flag.dart';
import 'package:lot_size_calculator_app/provider/lot_size_calculator_controller.dart';
import 'package:lot_size_calculator_app/provider/main_screen_controller.dart';
import 'package:lot_size_calculator_app/provider/user_controller.dart';
import 'package:lot_size_calculator_app/services/google_sheet_services.dart';
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
  late String selectedCurrencyPair = AppConst.strEmpty;
  late String selectedCurrencyPairRate = AppConst.strEmpty;

  @override
  void initState() {
    super.initState();
    print('LotSizeCalculatorPage');
    initialize();

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
    // final String selectedCurrencyPair = ref
    //     .watch(currencyPairModelNotifierProvider)
    //     .when(
    //       loading: () => AppConst.strEmpty,
    //       error: (e, s) => AppConst.strEmpty,
    //       data: (d) =>
    //           d.firstWhere((element) => element.selected == true).currencyPair,
    //     );
    // final String selectedCurrencyPairRate = ref
    //     .watch(currencyPairModelNotifierProvider)
    //     .when(
    //       loading: () => AppConst.loadingText,
    //       error: (e, s) => AppConst.errorText,
    //       data: (d) => d.firstWhere((element) => element.selected == true).rate,
    //     );
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const FavoriteCurrencyPairListPage()),
                                ).then((result) {
                                  initialize();
                                });
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

  Future<void> initialize() async {
    if (kDebugMode) {
      print('LotSizeCalculatorPage initialize');
    }
    final isar = IsarService.instance;
    final list = GoogleSheetService.instance.list;
    final isarData = await isar.fechSelectedCurrencyPair();
    selectedCurrencyPair = isarData!.pair;
    final data = list
        .firstWhere((element) => element.currencyPair == selectedCurrencyPair);
    selectedCurrencyPairRate = data.rate;
    setState(() {});
  }
}
