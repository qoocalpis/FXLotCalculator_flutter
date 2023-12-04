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
    flag1 = "images/${widget.currencyPair.substring(0, 3)}.png";
    flag2 = "images/USD.png";
    print(flag1);
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: widget.size,
        height: widget.size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("images/USD.png"),
          ),
        ),
      ),
      Text(
        "/",
        style: TextStyle(
          fontSize: widget.size,
          fontWeight: FontWeight.w100,
        ),
      ),
      Container(
        width: widget.size,
        height: widget.size,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("images/USD.png"))),
      ),
    ]);
  }
}
