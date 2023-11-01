import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/models/currency_pair_object.dart';
import 'package:lot_size_calculator_app/utils/colors.dart';

class CurrencyPairListPage extends ConsumerWidget {
  const CurrencyPairListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: ListView.builder(
        itemCount: CurrencyPairObject.currencyPairList.length, // この行を追加
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.yellow),
            ),
            child: Text(CurrencyPairObject.currencyPairList[index]),
          );
        },
      ),
    );
  }
}
