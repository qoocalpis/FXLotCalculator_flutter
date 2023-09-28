import 'package:flutter/material.dart';
import 'package:lot_size_calculator_app/component/colors.dart';
import 'package:lot_size_calculator_app/component/sizes.dart';
import 'package:lot_size_calculator_app/widgets/numPad.dart';

class TwoNumKeyboardPage extends StatelessWidget {
  const TwoNumKeyboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.twoNumKeyboardPageHeigh,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const NumText(),
                // implement the custom NumPad
                NumPad(
                  buttonSize: SizeConfig.twoNumKeyboardButtonSize,
                  buttonColor: AppColor.lossCutBgColor,
                  iconColor: Colors.purple,
                  isRisk: true,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NumPad(
                  buttonSize: SizeConfig.twoNumKeyboardButtonSize,
                  buttonColor: AppColor.takeProfitBgColor,
                  isRisk: false,
                  iconColor: Colors.purple,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
