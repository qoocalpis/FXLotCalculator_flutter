import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Translate {
// シングルトンのインスタンスを格納するプライベートフィールド
  static final Translate _instance = Translate._internal();
  static bool initBool = false;

  // プライベートコンストラクタ
  Translate._internal();

  // シングルトンのインスタンスを取得するファクトリメソッド
  factory Translate() {
    return _instance;
  }

  static String? lotSizeCalculatorTitle;
  static String? riskRewardRatioTitle;

  void init(BuildContext context) {
    if (!initBool) {
      lotSizeCalculatorTitle =
          AppLocalizations.of(context)?.lotSizeCalculatorTitle;
      riskRewardRatioTitle = AppLocalizations.of(context)?.riskRewardRatioTitle;

      print('Translate.init(context)');
      initBool = true;
    }
  }
}
