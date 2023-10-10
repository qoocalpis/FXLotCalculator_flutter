import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lot_size_calculator_app/pages/widgets/risk_reward_column.dart';
import 'package:lot_size_calculator_app/provider/main_screen_controller.dart';
import 'package:lot_size_calculator_app/provider/risk_reward_controller.dart';
// import 'package:lot_size_calculator_app/component/colors.dart';
// import 'package:lot_size_calculator_app/component/sizes.dart';
import 'package:lot_size_calculator_app/pages/widgets/chart_bar.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';
import 'two_num_keyboard_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiskRewardRatioPage extends ConsumerWidget {
  const RiskRewardRatioPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('RiskRewardRatioPage');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .watch(mainScreenModelNotifierProvider.notifier)
          .setScreenTitle(AppLocalizations.of(context)!.riskRewardRatioTitle);
    });
    final modelProvider = ref.watch(riskRewardModelNotifierProvider);
    return SingleChildScrollView(
      child: Column(
        children: [
          const ChartBar(),
          Padding(
            padding: const EdgeInsets.only(top: 10),
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
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(children: [
              Text(AppLocalizations.of(context)!.riskRewardRatioTitle)
            ]),
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
              padding: const EdgeInsetsDirectional.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RiskRewardColumn(
                    title: AppLocalizations.of(context)!.risk,
                    text: modelProvider.riskRatio,
                  ),
                  const RiskRewardColumn(
                    title: AppConst.strEmpty,
                    text: ':',
                  ),
                  RiskRewardColumn(
                    title: AppLocalizations.of(context)!.reward,
                    text: modelProvider.rewardRatio,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
