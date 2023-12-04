import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/models/currency_pair_model.dart';
import 'package:lot_size_calculator_app/provider/currency_pair_controller.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';

class CurrencyPairListCell extends ConsumerWidget {
  const CurrencyPairListCell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<CurrencyPairModel> list = ref
        .watch(currencyPairModelNotifierProvider)
        .when(loading: () => [], error: (e, s) => [], data: (d) => d.toList());
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        for (int index = 0; index < list.length; index++)
          GestureDetector(
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
                      const Text(
                        "AA",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      Icon(
                        Icons.grade,
                        size: 35,
                        color: list[index].addedToFavorite
                            ? const Color.fromARGB(255, 255, 216, 124)
                            : const Color.fromARGB(0, 255, 216, 124),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            onTap: () {
              final notifier =
                  ref.read(currencyPairModelNotifierProvider.notifier);
              notifier.onChangeProperty(index);
            },
          ),
      ],
    );
  }
}
