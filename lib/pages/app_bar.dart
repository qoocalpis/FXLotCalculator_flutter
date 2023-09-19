import 'package:flutter/material.dart';
import 'package:lot_size_calculator_app/component/colors.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final double appBarHeight = MediaQuery.of(context).size.height * 0.1;

    return PreferredSize(
      preferredSize: Size.fromHeight(appBarHeight), // AppBarの高さ
      child: AppBar(
        backgroundColor: AppColor.appBarBgColor,
        bottom: const TabBar(labelColor: Colors.yellow, tabs: [
          Tab(
            icon: ImageIcon(
              AssetImage("images/calculator.png"),
            ),
          ),
          Tab(
            icon: ImageIcon(
              AssetImage("images/risk_reward_ratio.png"),
            ),
          )
        ]),
        //title: Text(widget.title),
      ),
    );
  }
}
