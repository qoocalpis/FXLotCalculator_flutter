import 'package:flutter/material.dart';
import 'package:lot_size_calculator_app/models/currency_pair_model.dart';
import 'package:lot_size_calculator_app/services/google_sheet_services.dart';
import 'package:lot_size_calculator_app/services/isar_services.dart';
import 'package:lot_size_calculator_app/utils/colors.dart';

class CurrencyPairListPage extends StatefulWidget {
  const CurrencyPairListPage({super.key});
  @override
  CurrencyPairListState createState() => CurrencyPairListState();
}

class CurrencyPairListState extends State<CurrencyPairListPage> {
  final isar = IsarService.instance.fechCurrencyPairList();
  final list = GoogleSheetService.instance.list;
  late int _index = 0;
  @override
  void initState() {
    super.initState();
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
            for (var item in list)
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text(item.currencyPair),
                selected: true,
                onTap: () {
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
