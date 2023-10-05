import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:lot_size_calculator_app/component/colors.dart';
// import 'package:lot_size_calculator_app/component/sizes.dart';
import 'package:lot_size_calculator_app/widgets/chart_bar.dart';
import 'two_num_keyboard_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiskRewardRatioPage extends ConsumerWidget {
  const RiskRewardRatioPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        const AspectRatio(
          aspectRatio: 14 / 9,
          child: ChartBar(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: ElevatedButton(
            onPressed: () => showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              context: context,
              // showModalBottomSheetで表示される中身
              builder: (context) => const TwoNumKeyboardPage(),
            ),
            child: Text(
              AppLocalizations.of(context)!.riskRewardsetting,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          //height: SizeConfig.screenHeight * 0.15,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.black // ダークモードの場合の色
                : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromARGB(255, 176, 176, 176) // ダークモードの場合の色
                    : const Color.fromARGB(255, 104, 104, 104),
                blurRadius: 1.0,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.risk),
                    const Text(
                      '1',
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(''),
                    Text(
                      ':',
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.reward),
                    const Text(
                      '2',
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
