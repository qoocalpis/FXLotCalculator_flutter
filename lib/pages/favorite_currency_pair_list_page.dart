import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/models/currency_pair_model.dart';
import 'package:lot_size_calculator_app/provider/currency_pair_controller.dart';
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
  late List<CurrencyPairModel> list = [];
  @override
  void initState() {
    super.initState();
    Future(() async {
      final tmpList = ref.read(currencyPairModelNotifierProvider).when(
            loading: () => [],
            error: (e, s) => [],
            data: (d) =>
                d.where((element) => element.addedToFavorite == true).toList(),
          );
      if (tmpList.isNotEmpty) {
        for (var element in list) {
          list.add(element);
          print(element);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final list = ref.read(currencyPairModelNotifierProvider).when(
          loading: () => [],
          error: (e, s) => [],
          data: (d) =>
              d.where((element) => element.addedToFavorite == true).toList(),
        );
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
        itemCount: list.length, // この行を追加
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 140, 140, 138),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(AppConst.strEmpty),
                      Text(
                        list[index].currencyPair,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        list[index].currencyPairName,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 12,
                      ),
                      Icon(
                        Icons.grade,
                        size: 35,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            onTap: () async {},
          );
        },
      ),
    );
  }
}
