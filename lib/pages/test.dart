import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/s1.dart';
part 'lot_size_calculator_app/main.dart';

class MyWidget extends ConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s1 = ref.watch(s1NotifierProvider);

    final notifier = ref.read(s1NotifierProvider.notifier);

    return Center(
      child: Column(
        children: [
          Text('$s1'),
          TextButton(
            onPressed: () {
              notifier.updateState();
            },
            child: Text('ボタン'),
          ),
        ],
      ),
    );
  }
}
