import 'dart:js';
import 'package:flutter/material.dart';

class AppSize {
  static final double width = MediaQuery.of(context as BuildContext).size.width;
  static final double height =
      MediaQuery.of(context as BuildContext).size.height;

  static final double appBarHeight = height * 0.5;
}
