import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/pages/setting_page.dart';
import 'package:lot_size_calculator_app/provider/main_screen_controller.dart';
import 'package:lot_size_calculator_app/utils/colors.dart';
import 'package:lot_size_calculator_app/utils/sizes.dart';
import 'package:lot_size_calculator_app/pages/lot_size_calculator_page.dart';
import 'package:lot_size_calculator_app/pages/risk_reward_ratio_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends ConsumerWidget {
  static const List<Tab> appTabs = <Tab>[
    Tab(icon: ImageIcon(AssetImage('images/calculator.png'))),
    Tab(icon: ImageIcon(AssetImage('images/risk_reward_ratio.png'))),
  ];

  const MainScreen({super.key});

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
            backgroundColor: AppColor.mainBgColor,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.manage_accounts,
                size: 35,
                color: Color.fromARGB(255, 74, 48, 220),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return const SettingPage();
                    },
                  ),
                );
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ),
        body: TabBarView(children: [
          LotSizeCalculatorPage(
            title: AppLocalizations.of(context)!.riskRewardRatioTitle,
          ),
          RiskRewardRatioPage(
            title: AppLocalizations.of(context)!.riskRewardRatioTitle,
          ),
          // MyWidget(),
        ]),
      ),
    );
  }
}
