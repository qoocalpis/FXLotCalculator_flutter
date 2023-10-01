import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/component/sizes.dart';
import 'package:lot_size_calculator_app/provider/risk_reward_pips_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// KeyPad widget
// This widget is reusable and its buttons are customizable (color, size)

class NumText extends ConsumerWidget {
  const NumText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final riskPips = ref.watch(riskPipsNotifierProvider);
    final rewardPips = ref.watch(rewardPipsNotifierProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          alignment: Alignment.center,
          width: SizeConfig.riskRewardPipsTextWidth,
          height: SizeConfig.riskRewardPipsTextWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '$riskPips',
                    style: TextStyle(
                        fontSize: SizeConfig.twoNumKeyboardNumSize,
                        color: Colors.black87),
                  ),
                  const Text(
                    'pips',
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
              ),
              Text(
                AppLocalizations.of(context)!.risk,
                style: const TextStyle(color: Colors.black87),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: SizeConfig.riskRewardPipsTextWidth,
          height: SizeConfig.riskRewardPipsTextWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '$rewardPips',
                    style: TextStyle(
                        fontSize: SizeConfig.twoNumKeyboardNumSize,
                        color: Colors.black87),
                  ),
                  const Text(
                    'pips',
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
              ),
              Text(
                AppLocalizations.of(context)!.reward,
                style: const TextStyle(color: Colors.black87),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NumPad extends ConsumerWidget {
  final double buttonSize;
  final Color buttonColor;
  final Color iconColor;
  final bool isRisk;

  const NumPad({
    Key? key,
    this.buttonSize = 70,
    this.buttonColor = Colors.indigo,
    this.iconColor = Colors.amber,
    required this.isRisk,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            NumberButton(
              number: 1,
              size: buttonSize,
              color: buttonColor,
              isRisk: isRisk,
            ),
            const SizedBox(width: 5),
            NumberButton(
              number: 2,
              size: buttonSize,
              color: buttonColor,
              isRisk: isRisk,
            ),
            const SizedBox(width: 5),
            NumberButton(
              number: 3,
              size: buttonSize,
              color: buttonColor,
              isRisk: isRisk,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            NumberButton(
              number: 4,
              size: buttonSize,
              color: buttonColor,
              isRisk: isRisk,
            ),
            const SizedBox(width: 5),
            NumberButton(
              number: 5,
              size: buttonSize,
              color: buttonColor,
              isRisk: isRisk,
            ),
            const SizedBox(width: 5),
            NumberButton(
              number: 6,
              size: buttonSize,
              color: buttonColor,
              isRisk: isRisk,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            NumberButton(
              number: 7,
              size: buttonSize,
              color: buttonColor,
              isRisk: isRisk,
            ),
            const SizedBox(width: 5),
            NumberButton(
              number: 8,
              size: buttonSize,
              color: buttonColor,
              isRisk: isRisk,
            ),
            const SizedBox(width: 5),
            NumberButton(
              number: 9,
              size: buttonSize,
              color: buttonColor,
              isRisk: isRisk,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            SizedBox(
              width: buttonSize,
              child: ElevatedButton(
                onPressed: () {
                  if (isRisk) {
                    ref
                        .read(riskPipsNotifierProvider.notifier)
                        .allDeleteState();
                  } else {
                    ref
                        .read(rewardPipsNotifierProvider.notifier)
                        .allDeleteState();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  shadowColor: const Color.fromARGB(255, 27, 26, 25),
                  fixedSize: Size(buttonSize * 0.9, buttonSize * 0.9),
                  shape: const CircleBorder(),
                ),
                child: Text(
                  'AC',
                  style: TextStyle(
                    fontSize: buttonSize * 0.27,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            NumberButton(
              number: 0,
              size: buttonSize,
              color: buttonColor,
              isRisk: isRisk,
            ),
            const SizedBox(width: 5),
            SizedBox(
              width: buttonSize,
              height: buttonSize,
              child: IconButton(
                onPressed: () {
                  if (isRisk) {
                    ref.read(riskPipsNotifierProvider.notifier).deleteState();
                  } else {
                    ref.read(rewardPipsNotifierProvider.notifier).deleteState();
                  }
                },
                icon: Icon(
                  Icons.backspace,
                  color: iconColor,
                ),
                iconSize: buttonSize * 0.7,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// define NumberButton widget
// its shape is round
class NumberButton extends ConsumerWidget {
  final int number;
  final double size;
  final Color color;
  final bool isRisk;

  const NumberButton({
    Key? key,
    this.isRisk = false,
    required this.number,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size * 0.2),
          ),
        ),
        onPressed: () {
          if (isRisk) {
            final riskPipsNotifier =
                ref.read(riskPipsNotifierProvider.notifier);
            riskPipsNotifier.updateState(number);
          } else {
            final rewardPipsNotifier =
                ref.read(rewardPipsNotifierProvider.notifier);
            rewardPipsNotifier.updateState(number);
          }
        },
        child: Center(
          child: Text(
            number.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
