import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/pages/widgets/currency_pair_list_cell.dart';
import 'package:lot_size_calculator_app/provider/currency_pair_controller.dart';
import 'package:lot_size_calculator_app/services/db_model/currency_pair.dart';
import 'package:lot_size_calculator_app/services/google_sheet_services.dart';
import 'package:lot_size_calculator_app/services/isar_services.dart';
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
        title: Text(AppLocalizations.of(context)!.currencyPairListTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            for (int i = 0; i < googleSheetAPIModelList.length; i++)
              CurrencyPairListCell(
                title: googleSheetAPIModelList[i].currencyPair,
                selected: currencyPairList[i].addedToFavorite,
                onTap: (context) async {
                  await _tapTile(googleSheetAPIModelList[i].currencyPair, i);
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
