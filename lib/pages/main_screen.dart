import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/provider/main_screen_controller.dart';
import 'package:lot_size_calculator_app/utils/colors.dart';
import 'package:lot_size_calculator_app/utils/sizes.dart';
import 'package:lot_size_calculator_app/pages/lot_size_calculator_page.dart';
import 'package:lot_size_calculator_app/pages/risk_reward_ratio_page.dart';
import 'package:lot_size_calculator_app/services/isar_services.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);

//   @override
//   State<MainScreen> createState() => _AppHomePageState();
// }

// class _AppHomePageState extends State<MainScreen>
//     with SingleTickerProviderStateMixin {
//   static const List<Tab> appTabs = <Tab>[
//     Tab(icon: ImageIcon(AssetImage('images/calculator.png'))),
//     Tab(icon: ImageIcon(AssetImage('images/risk_reward_ratio.png'))),
//   ];

//   late IsarService isarService;
//   late TabController _tabController;
//   String appBarTitle = 'null';

//   @override
//   void initState() {
//     super.initState();
//     appBarTitle = 'Lot Size Calculator';
//     isarService = IsarService();
//     isarService.createUser();
//     _tabController = TabController(length: appTabs.length, vsync: this);
//     _tabController.addListener(() {
//       setState(() {
//         if (0 == _tabController.index) {
//           appBarTitle = 'Lot Size Calculator';
//         } else {
//           appBarTitle = 'Risk Reward Ratio';
//         }
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(SizeConfig.appBarHeight), // AppBarの高さ
//         child: AppBar(
//           elevation: 0,
//           bottom: TabBar(
//             indicatorColor: const Color(0xffF15C22),
//             unselectedLabelColor: Colors.grey,
//             labelColor: const Color.fromARGB(255, 255, 255, 99),
//             controller: _tabController,
//             tabs: appTabs,
//           ),
//           title: Text(appBarTitle),
//           backgroundColor: AppColor.appBarBgColor,
//           centerTitle: true,
//         ),
//       ),
//       body: TabBarView(controller: _tabController, children: const [
//         LotSizeCalculatorPage(),
//         RiskRewardRatioPage(),
//         // MyWidget(),
//       ]),
//     );
//   }
// }

class MainScreen extends ConsumerWidget {
  static const List<Tab> appTabs = <Tab>[
    Tab(icon: ImageIcon(AssetImage('images/calculator.png'))),
    Tab(icon: ImageIcon(AssetImage('images/risk_reward_ratio.png'))),
  ];

  final isarService = IsarService();

  MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelProvider = ref.watch(mainScreenModelNotifierProvider);
    return DefaultTabController(
      length: appTabs.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(SizeConfig.appBarHeight), // AppBarの高さ
          child: AppBar(
            elevation: 0,
            bottom: const TabBar(
              indicatorColor: Color(0xffF15C22),
              unselectedLabelColor: Colors.grey,
              labelColor: Color.fromARGB(255, 255, 255, 99),
              tabs: appTabs,
            ),
            title: Text(modelProvider.screenTitle),
            backgroundColor: AppColor.appBarBgColor,
            centerTitle: true,
          ),
        ),
        body: const TabBarView(children: [
          LotSizeCalculatorPage(),
          RiskRewardRatioPage(),
          // MyWidget(),
        ]),
      ),
    );
  }
}
