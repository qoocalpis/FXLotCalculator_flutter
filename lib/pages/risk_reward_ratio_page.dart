import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lot_size_calculator_app/pages/widgets/risk_reward_colum.dart';
import 'package:lot_size_calculator_app/provider/main_screen_controller.dart';
import 'package:lot_size_calculator_app/provider/risk_reward_controller.dart';
import 'package:lot_size_calculator_app/pages/widgets/chart_bar.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';
import 'two_num_keyboard_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiskRewardRatioPage extends ConsumerStatefulWidget {
  const RiskRewardRatioPage({
    super.key,
    required this.title,
  });
  final String title;
  @override
  RiskRewardRatioState createState() => RiskRewardRatioState();
}

class RiskRewardRatioState extends ConsumerState<RiskRewardRatioPage> {
  @override
  void initState() {
    super.initState();
    print('RiskRewardRatioPage');
    Future(() async {
      ref
          .watch(mainScreenModelNotifierProvider.notifier)
          .setScreenTitle(widget.title);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final modelProvider = ref.watch(riskRewardModelNotifierProvider);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ChartBar(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
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
            ],
          ),
          Text(
            AppLocalizations.of(context)!.riskRewardRatioTitle,
            textAlign: TextAlign.end,
          ),
          Container(
            margin: const EdgeInsets.all(5),
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
                  RiskRewardColum(
                    title: AppLocalizations.of(context)!.risk,
                    text: modelProvider.riskRatio,
                  ),
                  const RiskRewardColum(
                    title: AppConst.strEmpty,
                    text: ':',
                  ),
                  RiskRewardColum(
                    title: AppLocalizations.of(context)!.reward,
                    text: modelProvider.rewardRatio,
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                child: Text(
                  "資金率",
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                child: Text(
                  "損益率",
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                child: Text(
                  "勝率",
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                child: const Text(
                  "破産確率",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("AAA"),
              Text(modelProvider.rewardRatio),
              Column(
                children: [
                  for (var i = 0;
                      i < modelProvider.continuedLossProbability.length;
                      i++)
                    Container(
                      child: Text(
                        '${AppConst.winPercentList[i]} %',
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
              Column(
                children: [
                  for (var i = 0;
                      i < modelProvider.continuedLossProbability.length;
                      i++)
                    Container(
                      child: Text(
                        modelProvider.continuedLossProbability[i],
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
