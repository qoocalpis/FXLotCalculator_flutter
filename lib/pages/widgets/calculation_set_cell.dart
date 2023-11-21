import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/provider/lot_size_calculator_controller.dart';
import 'package:lot_size_calculator_app/provider/user_controller.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';

class CalculationSetCell extends ConsumerWidget {
  CalculationSetCell({
    super.key,
    required this.title,
    required this.type,
    this.subTitle = AppConst.strEmpty,
  });

  final String title;
  final UpdatePropertyType type;
  final String subTitle;
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModelProvider = ref.watch(userModelNotifierProvider).when(
          loading: () => null,
          error: (e, s) => null,
          data: (d) {},
        );
    return Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color.fromARGB(
                            255, 176, 176, 176) // ダークモードの場合の色
                        : const Color.fromARGB(255, 104, 104, 104),
                    width: 1),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
            ),
            Positioned(
              top: 10.0,
              left: 10.0,
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Positioned(
              top: 10.0,
              right: 10.0,
              child: Text(
                subTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Positioned(
              bottom: 15.0,
              right: 10,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: TextField(
                  controller: _textController,
                  textAlign: TextAlign.center,
                  keyboardType: defaultTargetPlatform == TargetPlatform.iOS
                      ? const TextInputType.numberWithOptions(
                          decimal: true, signed: true)
                      : TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  onChanged: (text) {
                    final lotSizeCalculatorModelNotifier = ref
                        .read(lotSizeCalculatorModelNotifierProvider.notifier);
                    lotSizeCalculatorModelNotifier.updateProperty(
                        text, type, userModelProvider);
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
