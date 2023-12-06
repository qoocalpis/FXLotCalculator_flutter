import 'package:flutter/material.dart';
import 'package:lot_size_calculator_app/pages/widgets/currency_pair_list_cell.dart';
import 'package:lot_size_calculator_app/services/db_model/currency_pair.dart';
import 'package:lot_size_calculator_app/services/google_sheet_services.dart';
import 'package:lot_size_calculator_app/services/isar_services.dart';
import 'package:lot_size_calculator_app/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CurrencyPairListPage extends StatefulWidget {
  const CurrencyPairListPage({super.key});
  @override
  CurrencyPairListState createState() => CurrencyPairListState();
}

class CurrencyPairListState extends State<CurrencyPairListPage> {
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final t = ttt();
    for (var pair in googleSheet.list) {}
    AppLocalizations.of(context)!.currencyPairListTitle;
    setState(() {});
  }

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
                onTap: (context) {
                  currencyPairList[i].addedToFavorite =
                      !currencyPairList[i].addedToFavorite;
                  _tapTile(i);
                },
              )
          ],
        ),
      ),
    );
  }

  Future<void> initialize() async {
    currencyPairList = await isar.fechCurrencyPairList();
    googleSheetAPIModelList = googleSheet.list;

    setState(() {});
  }

  String ttt() {
    AppLocalizations.of(context)!.currencyPairListTitle;

    return '';
  }

  Future<void> _tapTile(int index) async {
    setState(() {});
    await isar.changedAddedFavorite(index);
  }
}
