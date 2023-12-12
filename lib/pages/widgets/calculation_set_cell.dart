import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/provider/lot_size_calculator_controller.dart';
import 'package:lot_size_calculator_app/services/isar_services.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';

class CalculationSetCell extends ConsumerStatefulWidget {
  const CalculationSetCell({
    super.key,
    required this.title,
    required this.type,
    this.subTitle = AppConst.strEmpty,
    this.needsDefaultText = false,
  });

  final String title;
  final UpdatePropertyType type;
  final String subTitle;
  final bool needsDefaultText;

  @override
  CalculationSetState createState() => CalculationSetState();
}

class CalculationSetState extends ConsumerState<CalculationSetCell> {
  late TextEditingController textController;
  String text = AppConst.strEmpty;
  bool isEnable = true;
  bool isFirstFecthPercent = true;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    if (widget.type == UpdatePropertyType.percent) {
      final percent = ref.read(lotSizeCalculatorModelNotifierProvider).percent;
      if (percent > AppConst.zero) {
        textController.text = percent.toString();
        return;
      }
      final isar = IsarService.instance;
      Future(() async {
        final percent = await isar.fechPercent();
        textController.text = percent.toString();
      });
      return;
    }
    if (widget.type == UpdatePropertyType.accountBalance) {
      textController.text = ref
          .read(lotSizeCalculatorModelNotifierProvider)
          .accountBalance
          .toString();
      return;
    }
    if (widget.type == UpdatePropertyType.pips) {
      textController.text =
          ref.read(lotSizeCalculatorModelNotifierProvider).pips.toString();
      return;
    }
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      ? const Color.fromARGB(255, 176, 176, 176) // ダークモードの場合の色
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
              widget.title,
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
              widget.subTitle,
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
                controller: textController,
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
                onChanged: (value) {
                  // カスタムの入力変更ハンドラ
                  if (value.isNotEmpty &&
                      value[AppConst.zero] == AppConst.strZero) {
                    // 最初の文字が0ならば0を削除
                    textController.text = value.substring(1);
                    textController.selection = TextSelection.fromPosition(
                      TextPosition(offset: textController.text.length),
                    );
                  }
                  if (value.isEmpty) {
                    textController.text = AppConst.strZero;
                  }
                  final calculatorModelNotifier =
                      ref.read(lotSizeCalculatorModelNotifierProvider.notifier);
                  calculatorModelNotifier.updateProperty(
                      textController.text, widget.type);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
