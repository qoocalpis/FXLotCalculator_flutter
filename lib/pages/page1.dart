import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lot_size_calculator_app/pages/page3.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text(
          AppLocalizations.of(context)!.loadingRateApi,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(
      icon: ImageIcon(
        AssetImage('images/calculator.png'),
      ),
    ),
    Tab(
      icon: ImageIcon(
        AssetImage('images/risk_reward_ratio.png'),
      ),
    )
  ];

  late TabController _tabController;
  late String title;
  var currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    _tabController.addListener(() {
      setState(() {
        currentIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  selectedTabChanged() {
    if (!_tabController.indexIsChanging) {
      switch (_tabController.index) {
        case 0:
          break;
        case 1:
          break;
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // final double appBarHeight = MediaQuery.of(context).size.height * 0.1;
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          labelStyle: const TextStyle(fontSize: 28.0),
          controller: _tabController,
          tabs: myTabs,
        ),
        title: Text('Index : $currentIndex'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Page1(),
          Page3(),
        ],
      ),
    );
  }
}
