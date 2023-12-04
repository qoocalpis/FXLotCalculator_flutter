import 'package:flutter/material.dart';
import 'package:lot_size_calculator_app/services/db_model/currency_pair.dart';
import 'package:lot_size_calculator_app/services/google_sheet_services.dart';
import 'package:lot_size_calculator_app/services/isar_services.dart';
import 'package:lot_size_calculator_app/utils/colors.dart';

class CurrencyPairListPage extends StatefulWidget {
  const CurrencyPairListPage({super.key});
  @override
  CurrencyPairListState createState() => CurrencyPairListState();
}

class CurrencyPairListState extends State<CurrencyPairListPage> {
  final isar = IsarService.instance;
  final googleSheet = GoogleSheetService.instance;
  late List<GoogleSheetAPIModel> list = [];
  late List<CurrencyPair> list2 = [];
  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    list2 = await isar.fechCurrencyPairList();
    list = googleSheet.list;
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
        title: const Text("通貨ペアリスト"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            for (int i = 0; i < list.length; i++)
              ListTile(
                trailing: const Icon(Icons.grade),
                title: Text(list[i].currencyPair),
                subtitle: Text(list[i].currencyCode),
                selected: list2[i].addedToFavorite,
                onTap: () {
                  list2[i].addedToFavorite = !list2[i].addedToFavorite;
                  _tapTile();
                },
              )
          ],
        ),
      ),
    );
  }

  void _tapTile() {
    setState(() {
      // _message = 'No. $_index を選択しました';
    });
  }
}
