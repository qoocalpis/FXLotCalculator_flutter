import 'package:flutter/material.dart';

class NationalFlag extends StatefulWidget {
  final String currencyPair;

  const NationalFlag({
    super.key,
    required this.currencyPair,
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
    flag1 = "images/${widget.currencyPair.substring(0, 3)}.png";
    flag2 = "images/USD.png";
    print(flag1);
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(flag1),
          ),
        ),
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
                fit: BoxFit.fill, image: AssetImage("images/USD.png"))),
      ),
    ]);
  }
}
