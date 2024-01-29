import 'package:flutter/material.dart';
import 'package:lot_size_calculator_app/pages/widgets/national_flag.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';

class CurrencyPairListCell extends StatelessWidget {
  const CurrencyPairListCell({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
    this.tileColor,
    this.subTitle = AppConst.strEmpty,
  });

  final String title;
  final bool selected;
  final String subTitle;
  final Color? tileColor;

  final void Function(BuildContext) onTap; //your function expects a context

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 140, 140, 138),
          ),
          color: tileColor,
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
                const Text(AppConst.strEmpty), //dummy
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  subTitle,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            NationalFlag(
              currencyPair: title,
              size: 40,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 12,
                ),
                Icon(
                  Icons.grade,
                  size: 35,
                  color: selected
                      ? const Color.fromARGB(255, 255, 216, 124)
                      : const Color.fromARGB(0, 255, 216, 124),
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: () => onTap(context), //pass context here
    );
  }
}
