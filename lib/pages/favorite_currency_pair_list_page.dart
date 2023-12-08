import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/models/currency_pair_model.dart';
import 'package:lot_size_calculator_app/provider/currency_pair_controller.dart';
import 'package:lot_size_calculator_app/provider/user_controller.dart';
import 'package:lot_size_calculator_app/services/db_model/currency_pair.dart';
import 'package:lot_size_calculator_app/services/google_sheet_services.dart';
import 'package:lot_size_calculator_app/services/isar_services.dart';
import 'package:lot_size_calculator_app/utils/colors.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';

class FavoriteCurrencyPairListPage extends ConsumerStatefulWidget {
  const FavoriteCurrencyPairListPage({super.key});

  @override
  FavoriteCurrencyPairListState createState() =>
      FavoriteCurrencyPairListState();
}

class FavoriteCurrencyPairListState
    extends ConsumerState<FavoriteCurrencyPairListPage> {
  final isar = IsarService.instance;
  final googleSheet = GoogleSheetService.instance;
  late List<GoogleSheetAPIModel> googleSheetAPIModelList = [];
  late List<CurrencyPair> currencyPairList = [];
  late List<String> currencyPairFullNameList = [];
  late int _index = 0;
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
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: Colors.blue,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            for (int i = 0; i < googleSheetAPIModelList.length; i++)
              ListTile(
                title: Text(googleSheetAPIModelList[i].currencyPair),
                selected: _index == i,
                selectedTileColor: Colors.orange,
                onTap: () {
                  if (_index == i) {
                    return;
                  }
                  _index = i;
                  _tapTile(currencyPairList[i].pair, true);
                },
              )
          ],
        ),
      ),
    );
  }

  Future<void> initialize() async {
    currencyPairList.clear();
    googleSheetAPIModelList.clear();
    currencyPairList = await isar.fechFavoriteCurrencyPairList();

    for (var i in currencyPairList) {
      for (var j in googleSheet.list) {
        if (i.pair == j.currencyPair) {
          googleSheetAPIModelList.add(j);
        }
      }
    }
    setState(() {});
  }

  Future<void> _tapTile(String pair, bool selected) async {
    await isar.changedSelected(pair, selected);
    final notifier = ref.read(currencyPairModelNotifierProvider.notifier);
    notifier.onChangeSelectedProperty(pair, selected);
    setState(() {});
  }
}
