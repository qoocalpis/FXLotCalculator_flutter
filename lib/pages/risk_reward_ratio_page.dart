import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/commons/decorator.dart';
import 'package:d_chart/commons/style.dart';
import 'package:d_chart/ordinal/bar.dart';
import 'package:flutter/material.dart';
import 'package:lot_size_calculator_app/component/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lot_size_calculator_app/component/sizes.dart';
import 'two_num_keyboard_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class RiskRewardRatioPage extends StatefulWidget {
//   const RiskRewardRatioPage({super.key});
//   @override
//   State<RiskRewardRatioPage> createState() => _RiskRewardRatioPageState();
// }

class RiskRewardRatioPage extends ConsumerWidget {
  final appNameProvider = Provider((ref) => 'Special App!');
  final aaaa = Provider((ref) => 'Special App!');

  var ordinalGroup = [
    OrdinalGroup(
      id: '0',
      data: [
        OrdinalData(domain: 'Risk', measure: 0),
        OrdinalData(domain: 'Reward', measure: 0),
      ],
    ),
  ];

  RiskRewardRatioPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: AspectRatio(
              aspectRatio: 11 / 9,
              child: DChartBarO(
                animate: true,
                animationDuration: const Duration(milliseconds: 600),
                barLabelDecorator: BarLabelDecorator(),
                insideBarLabelStyle: (group, ordinalData, index) {
                  return const LabelStyle(
                    color: Colors.white,
                  );
                },
                barLabelValue: (group, ordinalData, index) =>
                    '${ordinalData.measure}pips',
                groupList: ordinalGroup,
                fillColor: (group, ordinalData, index) {
                  if (ordinalData.domain == 'Reward') {
                    return AppColor.takeProfitBgColor;
                  }
                  return AppColor.lossCutBgColor;
                },
                vertical: false,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            width: SizeConfig.screenWidth * 0.9,
            height: SizeConfig.screenHeight * 0.15,
            decoration: _boxDecoration(),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.risk),
                  ],
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(' '),
                    //Text(':'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.reward),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              context: context,
              // showModalBottomSheetで表示される中身
              builder: (context) => TwoNumKeyboardPage(),
            ),
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 30),
              foregroundColor: Colors.white, // foreground
              fixedSize: const Size(220, 80),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Text("クリック不可"),
          ),
        ],
      ),
    );
  }

  _boxDecoration() {
    return const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      boxShadow: [
        BoxShadow(
          color: Color(0xFFd8dbe0),
          offset: Offset(1, 1),
          blurRadius: 20.0,
          spreadRadius: 10,
        ),
      ],
    );
  }
}
