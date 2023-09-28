import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/provider/risk_reward_pips_controller.dart';
// import 'package:lot_size_calculator_app/s1.dart';
part 'lot_size_calculator_app/main.dart';

class MyWidget extends ConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s1 = ref.watch(riskPipsNotifierProvider);

    final notifier = ref.read(riskPipsNotifierProvider.notifier);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('$s1'),
          TextButton(
            onPressed: () {
              notifier.updateState(3);
            },
            child: Text(
              'ボタン',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
