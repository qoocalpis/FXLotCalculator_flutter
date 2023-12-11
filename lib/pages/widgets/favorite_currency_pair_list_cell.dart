import 'package:flutter/material.dart';
import 'package:lot_size_calculator_app/pages/widgets/national_flag.dart';
import 'package:lot_size_calculator_app/pages/widgets/price_text.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';

class FavoriteCurrencyPairListCell extends StatelessWidget {
  const FavoriteCurrencyPairListCell({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
    this.subTitle = AppConst.strEmpty,
  });

  final String title;
  final bool selected;
  final String subTitle;
  final void Function(BuildContext) onTap;

  @override
  Widget build(BuildContext context) {
    const textSize = 20.0;
    return GestureDetector(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 140, 140, 138),
          ),
          borderRadius: BorderRadius.circular(5),
          color: selected
              ? const Color.fromARGB(255, 53, 245, 114)
              : const Color.fromARGB(0, 9, 8, 5),
        ),
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: textSize * 6.5,
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: textSize,
                ),
              ),
            ),
            NationalFlag(
              currencyPair: title,
              size: 40,
            ),
            SizedBox(
              width: textSize * 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  PriceText(
                    textSize: textSize,
                    subTitle: subTitle,
                    title: title,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () => onTap(context), //pass context here
    );
  }
}
