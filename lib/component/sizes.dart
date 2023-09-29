import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double screenHurfHeight = 0;
  static double twoNumKeyboardPageHeigh = 0;
  static double twoNumKeyboardButtonSize = 0;
  static double appBarHeight = 0;
  static double riskRewardPipsTextWidth = 0;
  static double twoNumKeyboardNumSize = 0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    screenHurfHeight = screenHeight * 0.5;
    twoNumKeyboardPageHeigh = screenHeight * 0.8;
    twoNumKeyboardButtonSize = screenWidth * 0.13;
    appBarHeight = screenHeight * 0.11;
    riskRewardPipsTextWidth = screenWidth * 0.45;
    twoNumKeyboardNumSize = twoNumKeyboardButtonSize * 0.7;
  }
}
