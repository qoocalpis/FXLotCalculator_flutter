import 'package:flutter/material.dart';

class NationalFlag extends StatefulWidget {
  final String currencyPair;
  final double size;
  const NationalFlag({
    super.key,
    required this.currencyPair,
    required this.size,
  });
  @override
  State<NationalFlag> createState() => _NationalFlag();
}

class _NationalFlag extends State<NationalFlag> {
  late String flag1;
  late String flag2;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late String flag1;
    late String flag2;
    final fromCurrency = widget.currencyPair.substring(0, 3);
    final toCurrency = widget.currencyPair.substring(4, 7);
    switch (fromCurrency) {
      case 'CHF' || 'EUR':
        flag1 = "images/$fromCurrency.jpeg";
      case "XAU":
        flag1 = "images/$fromCurrency.jpg";
      default:
        flag1 = "images/$fromCurrency.png";
    }

    switch (toCurrency) {
      case 'CHF' || 'EUR':
        flag2 = "images/$toCurrency.jpeg";
      case "XAU":
        flag2 = "images/$toCurrency.jpg";
      default:
        flag2 = "images/$toCurrency.png";
    }
    return Row(children: [
      Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(flag1),
          ),
          border: Border.all(
            color: Colors.black,
            width: 0.1,
          ),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Text(
        "/",
        style: TextStyle(
          fontSize: widget.size,
          fontWeight: FontWeight.w300,
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(flag2),
          ),
          border: Border.all(
            color: Colors.black,
            width: 0.1,
          ),
        ),
      ),
    ]);
  }
}
