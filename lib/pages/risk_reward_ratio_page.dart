import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lot_size_calculator_app/pages/widgets/line_chart.dart';
import 'package:lot_size_calculator_app/pages/widgets/probability_table.dart';
import 'package:lot_size_calculator_app/pages/widgets/risk_reward_colum.dart';
import 'package:lot_size_calculator_app/pages/widgets/toggle_button.dart';
import 'package:lot_size_calculator_app/provider/in_app_purchase_controller.dart';
import 'package:lot_size_calculator_app/provider/main_screen_controller.dart';
import 'package:lot_size_calculator_app/provider/risk_reward_controller.dart';
import 'package:lot_size_calculator_app/pages/widgets/chart_bar.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';
import 'package:lot_size_calculator_app/utils/setting_constants.dart';
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
    FocusScope.of(context).unfocus();
    final modelProvider = ref.watch(riskRewardModelNotifierProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final isPurchased = ref.watch(inAppPurchaseNotifierProvider);
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
              borderRadius: BorderRadius.circular(10),
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
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Container(
              width: screenWidth,
              height: 10,
              color: Colors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                AppLocalizations.of(context)!.bankruptcProbabilityTable,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const ToggleButton(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                AppLocalizations.of(context)!.fundRatio,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 5,
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 20, bottom: 5),
                  child: Stack(
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(80, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20), //角の丸み
                          ),
                          backgroundColor: !isPurchased
                              ? const Color.fromARGB(255, 69, 70, 70)
                              : const Color.fromARGB(96, 199, 198, 198),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "${modelProvider.moneyRatio} %",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w900,
                                color: isPurchased
                                    ? const Color.fromARGB(255, 84, 209, 171)
                                    : Colors.grey,
                              ),
                            ),
                            Icon(
                              Icons.expand_more,
                              size: 20,
                              color: isPurchased
                                  ? const Color.fromARGB(255, 84, 209, 171)
                                  : Colors.grey,
                            ),
                          ],
                        ),
                        onPressed: () {
                          !isPurchased
                              ? null
                              : BottomPicker(
                                  items: List<Text>.generate(
                                    SettingConst.percentList.length,
                                    (index) => Text(
                                      SettingConst.percentList[index],
                                      style: const TextStyle(fontSize: 30),
                                    ),
                                  ),
                                  selectedItemIndex: SettingConst.percentList
                                      .indexOf(modelProvider.moneyRatio),
                                  title:
                                      "${AppLocalizations.of(context)!.fundRatio}(%)",
                                  titleStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                  displaySubmitButton: false,
                                  onChange: (index) {
                                    final modelNotifier = ref.read(
                                        riskRewardModelNotifierProvider
                                            .notifier);
                                    modelNotifier.onUpdateMoneyRatio(
                                        SettingConst.percentList[index]);
                                  },
                                  onClose: () {
                                    final modelNotifier = ref.read(
                                        riskRewardModelNotifierProvider
                                            .notifier);
                                    modelNotifier
                                        .onCalculateContinuedLossProbabilityFromButton();
                                  },
                                ).show(context);
                        },
                      ),
                      isPurchased
                          ? const SizedBox()
                          : const Icon(
                              Icons.lock,
                              color: Colors.orange,
                            ),
                    ],
                  )),
            ],
          ),
          modelProvider.showType == -1
              ? const LineChartPage()
              : const SizedBox(),
          modelProvider.showType == 1
              ? const ProbabilityTable()
              : const SizedBox(),
        ],
      ),
    );
  }
}
