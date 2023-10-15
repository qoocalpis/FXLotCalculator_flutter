import 'package:flutter/material.dart';

class SettingConst {
  SettingConst._();

  static const List<Text> accountCurrencys = <Text>[
    Text(
      'USD',
      style: TextStyle(fontSize: 30),
    ),
    Text(
      'JPY',
      style: TextStyle(fontSize: 30),
    ),
  ];

  static const List<Text> constractSizes = <Text>[
    Text(
      '1000',
      style: TextStyle(fontSize: 30),
    ),
    Text(
      '5000',
      style: TextStyle(fontSize: 30),
    ),
    Text(
      '10000',
      style: TextStyle(fontSize: 30),
    ),
    Text(
      '100000',
      style: TextStyle(fontSize: 30),
    ),
  ];
}
