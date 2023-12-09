import 'package:flutter/material.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';

class PriceText extends StatefulWidget {
  const PriceText({
    super.key,
    required this.textSize,
    required this.subTitle,
    required this.title,
  });

  final double textSize;
  final String subTitle;
  final String title;

  @override
  State<PriceText> createState() => _PriceTextState();
}

class _PriceTextState extends State<PriceText> {
  late String frontText;
  late String middleText;
  late String endText;
  @override
  void initState() {
    super.initState();
    final strPrice = widget.subTitle;

    if (widget.title == 'XAU/USD') {
      frontText = strPrice.substring(0, strPrice.length - 2);
      middleText = strPrice.substring(frontText.length, strPrice.length);
      endText = AppConst.strEmpty;
    } else {
      frontText = strPrice.substring(0, strPrice.length - 3);
      middleText = strPrice.substring(frontText.length, strPrice.length - 1);
      endText = strPrice.substring(strPrice.length - 1, strPrice.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.textSize * 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            frontText,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: widget.textSize,
            ),
          ),
          Text(
            middleText,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: widget.textSize * 1.3,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            endText,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: widget.textSize,
            ),
          ),
        ],
      ),
    );
  }
}
