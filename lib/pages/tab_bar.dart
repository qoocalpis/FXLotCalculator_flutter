import 'package:flutter/material.dart';
import 'package:lot_size_calculator_app/component/colors.dart';
import 'package:lot_size_calculator_app/pages/lot_size_calculator_page.dart';

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: 2);
    _tabController!.addListener(() {
      //インデックスが切り替わる際の処理
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<CustomTabBar> createState() => _CustomTabBar();
}

class _CustomTabBar extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    final double appBarHeight = MediaQuery.of(context).size.height * 0.1;
    return Scaffold(
      appBar: PreferredSize(
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
          title: Text(widget.title),
        ),
      ),
      body: TabBarView(children: [
        const Page1(),
        Container(
            //child: const Icon(Icons.settings),
            )
      ]),
    );
  }
}
