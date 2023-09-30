import 'package:flutter/material.dart';
// import 'package:lot_size_calculator_app/component/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lot_size_calculator_app/component/sizes.dart';
import 'package:lot_size_calculator_app/widgets/chartBar.dart';
import 'two_num_keyboard_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiskRewardRatioPage extends ConsumerWidget {
  const RiskRewardRatioPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(5),
            child: AspectRatio(
              aspectRatio: 11 / 9,
              child: ChartBar(),
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
              builder: (context) => const TwoNumKeyboardPage(),
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
