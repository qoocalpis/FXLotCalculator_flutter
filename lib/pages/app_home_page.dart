import 'package:flutter/material.dart';
import 'package:lot_size_calculator_app/component/colors.dart';
import 'package:lot_size_calculator_app/pages/lot_size_calculator_page.dart';
// import 'package:lot_size_calculator_app/pages/page3.dart';
import 'risk_reward_ratio_page.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({Key? key}) : super(key: key);
  @override
  AppHomePageState createState() => AppHomePageState();
}

class AppHomePageState extends State<AppHomePage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> appTabs = <Tab>[
    Tab(
      icon: ImageIcon(
        AssetImage('images/calculator.png'),
      ),
    ),
    Tab(
      icon: ImageIcon(
        AssetImage('images/risk_reward_ratio.png'),
      ),
    ),
  ];

  late TabController _tabController;
  String appBarTitle = 'null';

  @override
  void initState() {
    super.initState();
    appBarTitle = 'Lot Size Calculator';
    _tabController = TabController(vsync: this, length: appTabs.length);
    _tabController.addListener(() {
      setState(() {
        if (0 == _tabController.index) {
          appBarTitle = 'Lot Size Calculator';
        } else {
          appBarTitle = 'Risk Reward Ratio';
        }
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = MediaQuery.of(context).size.height * 0.11;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight), // AppBarの高さ
        child: AppBar(
          bottom: TabBar(
            indicatorColor: const Color(0xffF15C22),
            unselectedLabelColor: Colors.grey,
            labelColor: const Color.fromARGB(255, 255, 255, 99),
            controller: _tabController,
            tabs: appTabs,
          ),
          title: Text(appBarTitle),
          backgroundColor: AppColor.appBarBgColor,
          centerTitle: true,
        ),
      ),
      body: TabBarView(controller: _tabController, children: const [
        LotSizeCalculatorPage(),
        //RiskRewardRatioPage(),
        //Page3()
      ]),
    );
  }
}
