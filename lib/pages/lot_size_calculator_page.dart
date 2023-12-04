import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/models/user_model.dart';
import 'package:lot_size_calculator_app/pages/currency_pair_list_page.dart';
import 'package:lot_size_calculator_app/pages/favorite_currency_pair_list_page.dart';
import 'package:lot_size_calculator_app/pages/result_lot_size_page.dart';
import 'package:lot_size_calculator_app/pages/two_num_keyboard_page.dart';
import 'package:lot_size_calculator_app/pages/widgets/calculation_set_cell.dart';
import 'package:lot_size_calculator_app/pages/widgets/national_flag.dart';
import 'package:lot_size_calculator_app/provider/lot_size_calculator_controller.dart';
import 'package:lot_size_calculator_app/provider/main_screen_controller.dart';
import 'package:lot_size_calculator_app/provider/user_controller.dart';
import 'package:lot_size_calculator_app/services/db_model/currency_pair.dart';

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
    print('LotSizeCalculatorPage');

    final mainScreenModelNotifier =
        ref.read(mainScreenModelNotifierProvider.notifier);
    Future(() async {
      mainScreenModelNotifier.setScreenTitle(widget.title);
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserModel? userModelProvider =
        ref.watch(userModelNotifierProvider).when(
              loading: () => null,
              error: (e, s) => null,
              data: (d) => d,
            );
    final fontSize = MediaQuery.of(context).size.height * 0.035;
    final topContainerSize = MediaQuery.of(context).size.height * 0.15;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                      Text("", style: TextStyle(fontSize: fontSize)), //dummy
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("USD/JPY", style: TextStyle(fontSize: fontSize)),
                          const SizedBox(width: 10),
                          NationalFlag(
                            currencyPair: "USD/JPY",
                            size: fontSize,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.backspace),
                            onPressed: () => {
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
}
