import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/pages/widgets/currency_pair_list_cell.dart';
import 'package:lot_size_calculator_app/provider/currency_pair_controller.dart';
import 'package:lot_size_calculator_app/provider/in_app_purchase_controller.dart';
import 'package:lot_size_calculator_app/services/db_model/currency_pair.dart';
import 'package:lot_size_calculator_app/services/google_sheet_service.dart';
import 'package:lot_size_calculator_app/services/isar_service.dart';
import 'package:lot_size_calculator_app/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CurrencyPairListPage extends ConsumerStatefulWidget {
  const CurrencyPairListPage({super.key});
  @override
  CurrencyPairListState createState() => CurrencyPairListState();
}

class CurrencyPairListState extends ConsumerState<CurrencyPairListPage> {
  final isar = IsarService.instance;
  final googleSheet = GoogleSheetService.instance;
  late List<GoogleSheetAPIModel> googleSheetAPIModelList = [];
  late List<CurrencyPair> currencyPairList = [];
  late List<String> currencyPairFullNameList = [];

  @override
  void initState() {
    super.initState();
    initialize();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    final isPurchased = ref.watch(inAppPurchaseNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainBgColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: Colors.blue,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.currencyPairListTitle,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            isPurchased
                ? const SizedBox()
                : const Padding(
                    padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                    child: Text(
                      "Free",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
            for (int i = 0; i < googleSheetAPIModelList.length; i++)
              isPurchased
                  ? const SizedBox()
                  : googleSheetAPIModelList[i].currencyCode == "USDJPY" ||
                          googleSheetAPIModelList[i].currencyCode == "EURJPY" ||
                          googleSheetAPIModelList[i].currencyCode == "EURUSD"
                      ? CurrencyPairListCell(
                          title: googleSheetAPIModelList[i].currencyPair,
                          selected: currencyPairList[i].addedToFavorite,
                          onTap: (context) async {
                            await _tapTile(
                              googleSheetAPIModelList[i].currencyPair,
                              i,
                            );
                          },
                        )
                      : const SizedBox(),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                child: Row(
                  children: [
                    const Text(
                      "Pro+ ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    isPurchased
                        ? const SizedBox()
                        : const Icon(
                            Icons.lock,
                            color: Colors.orange,
                          ),
                  ],
                )),
            for (int i = 0; i < googleSheetAPIModelList.length; i++)
              CurrencyPairListCell(
                title: googleSheetAPIModelList[i].currencyPair,
                selected: currencyPairList[i].addedToFavorite,
                tileColor:
                    isPurchased ? null : const Color.fromARGB(255, 82, 82, 82),
                onTap: (context) async {
                  if (isPurchased) {
                    await _tapTile(
                      googleSheetAPIModelList[i].currencyPair,
                      i,
                    );
                  }
                },
              )
          ],
        ),
      ),
    );
  }

  Future<void> initialize() async {
    if (kDebugMode) {
      print('CurrencyPairListPage initialize');
    }
    currencyPairList = await isar.fechCurrencyPairList();
    googleSheetAPIModelList = googleSheet.list;
    setState(() {});
  }

  Future<void> _tapTile(String currencyPair, int index) async {
    final notifier = ref.read(currencyPairModelNotifierProvider.notifier);
    final res = await notifier.onChangeAddedFavoriteProperty(currencyPair);
    if (res) {
      currencyPairList[index].addedToFavorite =
          !currencyPairList[index].addedToFavorite;
      setState(() {});
    }
  }
}
