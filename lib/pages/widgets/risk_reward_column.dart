import 'package:flutter/material.dart';

class RiskRewardColumn extends StatelessWidget {
  const RiskRewardColumn({
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
          style: const TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}
