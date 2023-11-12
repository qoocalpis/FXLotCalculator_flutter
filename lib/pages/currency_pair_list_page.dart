import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/models/currency_pair_model.dart';
import 'package:lot_size_calculator_app/provider/currency_pair_controller.dart';
import 'package:lot_size_calculator_app/utils/colors.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';

class CurrencyPairListPage extends ConsumerWidget {
  CurrencyPairListPage({super.key});
  final List<CurrencyPairModel> emptyList = [];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<CurrencyPairModel> currencyPairModelProvider =
        ref.watch(currencyPairModelNotifierProvider).when(
              loading: () => emptyList,
              error: (e, s) => emptyList,
              data: (d) => d,
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
        itemCount: currencyPairModelProvider.length, // この行を追加
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
                        currencyPairModelProvider[index].currencyPair,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        currencyPairModelProvider[index].currencyPairName,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("images/USD.png"))),
                      ),
                      const Text(
                        "/",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("images/USD.png"))),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Icon(
                        Icons.grade,
                        size: 35,
                        color: currencyPairModelProvider[index].addedToFavorite
                            ? const Color.fromARGB(255, 255, 216, 124)
                            : const Color.fromARGB(0, 255, 216, 124),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            onTap: () async {
              final notifier =
                  ref.read(currencyPairModelNotifierProvider.notifier);
              await notifier.onChangeProperty(index);
            },
          );
        },
      ),
    );
  }
}
