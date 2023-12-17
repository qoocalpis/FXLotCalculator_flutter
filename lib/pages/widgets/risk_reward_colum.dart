import 'package:flutter/material.dart';

class RiskRewardColum extends StatelessWidget {
  const RiskRewardColum({
    super.key,
    required this.title,
    required this.text,
  });

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        Text(
          text,
          style: const TextStyle(fontSize: 35),
        ),
      ],
    );
  }
}
