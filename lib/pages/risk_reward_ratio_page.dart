import 'package:flutter/material.dart';
// import 'package:lot_size_calculator_app/component/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lot_size_calculator_app/component/colors.dart';
import 'package:lot_size_calculator_app/component/sizes.dart';
import 'package:lot_size_calculator_app/widgets/chartBar.dart';
import 'two_num_keyboard_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiskRewardRatioPage extends ConsumerWidget {
  const RiskRewardRatioPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // color: AppColor.riskRewardRatioPageBgColor,
      child: Column(
        children: [
          const AspectRatio(
            aspectRatio: 13 / 9,
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
              style: TextButton.styleFrom(
                textStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                foregroundColor: Colors.white, // foreground
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(AppLocalizations.of(context)!.riskRewardsetting),
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
                      : const Color.fromARGB(255, 70, 70, 70),
                  blurRadius: 1.0,
                  spreadRadius: 1,
                ),
              ],
            ),
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
        ],
      ),
    );
  }
}
