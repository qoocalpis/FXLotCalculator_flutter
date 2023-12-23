import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/provider/risk_reward_controller.dart';

class ToggleButton extends ConsumerStatefulWidget {
  const ToggleButton({super.key});

  @override
  ToggleButtonState createState() => ToggleButtonState();
}

const double width = 200.0;
const double height = 40.0;
const int loginAlign = -1;
const int signInAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.black54;

class ToggleButtonState extends ConsumerState<ToggleButton> {
  late int xAlign;
  late Color loginColor;
  late Color signInColor;

  @override
  void initState() {
    super.initState();
    xAlign = ref.read(riskRewardModelNotifierProvider).showType;
    loginColor = selectedColor;
    signInColor = normalColor;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: Alignment(xAlign.toDouble(), 0),
              duration: const Duration(milliseconds: 300),
              child: Container(
                width: width * 0.5,
                height: height,
                decoration: const BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  xAlign = loginAlign;
                  loginColor = selectedColor;
                  signInColor = normalColor;
                });
                ref
                    .read(riskRewardModelNotifierProvider.notifier)
                    .changeShowType(xAlign);
              },
              child: Align(
                alignment: const Alignment(-1, 0),
                child: Container(
                  width: width * 0.5,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(
                    '線グラフ',
                    style: TextStyle(
                      color: loginColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  xAlign = signInAlign;
                  signInColor = selectedColor;
                  loginColor = normalColor;
                });
                ref
                    .read(riskRewardModelNotifierProvider.notifier)
                    .changeShowType(xAlign);
              },
              child: Align(
                alignment: const Alignment(1, 0),
                child: Container(
                  width: width * 0.5,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(
                    '表',
                    style: TextStyle(
                      color: signInColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
