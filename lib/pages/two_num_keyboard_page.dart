import 'package:flutter/material.dart';
import 'package:lot_size_calculator_app/utils/colors.dart';
import 'package:lot_size_calculator_app/utils/sizes.dart';
import 'package:lot_size_calculator_app/pages/widgets/num_pad.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TwoNumKeyboardPage extends StatelessWidget {
  const TwoNumKeyboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.twoNumKeyboardPageHeigh,
      color: AppColor.twoNumKeyboardPageBgColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const NumText(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // implement the custom NumPad
                NumPad(
                  buttonSize: SizeConfig.twoNumKeyboardButtonSize,
                  buttonColor: AppColor.lossCutBgColor,
                  iconColor: Colors.purple,
                  isRisk: true,
                ),
                NumPad(
                  buttonSize: SizeConfig.twoNumKeyboardButtonSize,
                  buttonColor: AppColor.takeProfitBgColor,
                  isRisk: false,
                  iconColor: Colors.purple,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 98, 72, 232),
                shadowColor: const Color.fromARGB(255, 27, 26, 25),
                fixedSize: const Size(100, 50),
              ),
              child: Text(AppLocalizations.of(context)!.close),
            ),
          ],
        ),
      ),
    );
  }
}
