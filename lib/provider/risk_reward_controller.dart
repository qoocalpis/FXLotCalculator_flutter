import 'package:flutter/foundation.dart';
import 'package:lot_size_calculator_app/models/risk_reward_model.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';
import 'package:lot_size_calculator_app/utils/setting_constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:math';

part 'risk_reward_controller.g.dart';

@Riverpod(keepAlive: true)
class RiskRewardModelNotifier extends _$RiskRewardModelNotifier {
  static const equal = "=";
  @override
  RiskRewardModel build() => const RiskRewardModel();

  void updateState(int num, bool isRisk) {
    if (!checkNumLengthOver(isRisk)) {
      return;
    }

    String oldStrNum;
    int? newStateNum;

    if (isRisk) {
      oldStrNum = state.riskPips.toString();
      oldStrNum += num.toString();
      newStateNum = int.tryParse(oldStrNum);
      if (newStateNum == null) {
        state = state.copyWith(riskPips: 0);
      } else {
        state = state.copyWith(riskPips: newStateNum);
      }
    } else {
      oldStrNum = state.rewardPips.toString();
      oldStrNum += num.toString();
      newStateNum = int.tryParse(oldStrNum);
      if (newStateNum == null) {
        state = state.copyWith(rewardPips: 0);
      } else {
        state = state.copyWith(rewardPips: newStateNum);
      }
    }
    onCalculateRiskRewardRatio();
  }

  bool checkNumLengthOver(bool isRisk) {
    if (isRisk) {
      final oldStrNum = state.riskPips.toString();
      if (oldStrNum.length == 5) {
        return false;
      }
    } else {
      final oldStrNum = state.rewardPips.toString();
      if (oldStrNum.length == 5) {
        return false;
      }
    }
    return true;
  }

  void deleteState(bool isRisk) {
    String oldStrNum =
        isRisk ? state.riskPips.toString() : state.rewardPips.toString();
    if (oldStrNum.length <= 1) {
      state = isRisk
          ? state.copyWith(riskPips: AppConst.zero)
          : state.copyWith(rewardPips: AppConst.zero);
    } else {
      final newStrNum = oldStrNum.substring(0, oldStrNum.length - 1);
      final newNumState = int.tryParse(newStrNum)!;
      state = isRisk
          ? state.copyWith(riskPips: newNumState)
          : state.copyWith(rewardPips: newNumState);
    }
    onCalculateRiskRewardRatio();
  }

  void allDeleteState(bool isRisk) {
    state = isRisk
        ? state.copyWith(riskPips: AppConst.zero)
        : state.copyWith(rewardPips: AppConst.zero);
    onCalculateRiskRewardRatio();
  }

  void onUpdateMoneyRatio(String moneyRatio) {
    state = state.copyWith(moneyRatio: moneyRatio);
  }

  void onCalculateContinuedLossProbabilityFromButton() {
    onCalculateContinuedLossProbability(state.moneyRatio, state.rewardRatio);
  }

  void onCalculateRiskRewardRatio() {
    final risk = state.riskPips;
    final reward = state.rewardPips;
    bool isExist;

    if (risk == 0 || reward == 0) {
      state = state.copyWith(riskRatio: equal, rewardRatio: equal);
      isExist = false;
      return;
    }
    final roundedValue =
        double.parse((reward.toDouble() / risk.toDouble()).toStringAsFixed(1));

    String rewardRatio = roundedValue.toString();

    if (rewardRatio.toString().endsWith("0")) {
      rewardRatio = rewardRatio.substring(0, rewardRatio.length - 2);
    }
    isExist = true;
    state = state.copyWith(
        riskRatio: '1', rewardRatio: rewardRatio, isExist: isExist);
    onCalculateContinuedLossProbability(state.moneyRatio, rewardRatio);
  }

  void onCalculateContinuedLossProbability(
    String moneyRatio,
    String rewardRatio,
  ) {
    double n = 1; // 資金
    double b = int.parse(moneyRatio) / 100; // 資金率
    double? k = double.tryParse(rewardRatio); // 損益比率
    List<String> list = [];

    if (k == null) {
      for (var _ in SettingConst.percentList) {
        list.add(equal);
      }

      return;
    }
    for (var p in SettingConst.percentList) {
      double? X = solveEquation(int.parse(p) / 100, k);
      if (X == null) {
        list.add("error");
      } else {
        num Q = pow(X, n / b);
        var res = (Q * 100).toStringAsFixed(1);
        if (res.substring(res.length - 2) == '.0') {
          res = res.substring(0, res.length - 2);
        }
        if (kDebugMode) {
          // print("方程式の解 X: $X");
          // print("破産確率 Q(n): $Q");
        }
        list.add(res);
      }
    }
    state = state.copyWith(continuedLossProbability: list);
  }

  double? solveEquation(double p, double k) {
    // 初期値を設定
    double X = 0;

    // 収束条件や反復回数の設定
    double epsilon = 1e-6;
    int maxIterations = 1000;
    int iteration = 0;

    // 反復により方程式を解く
    while (iteration < maxIterations) {
      double nextX = p * pow(X, 1 + k) + (1 - p);
      // 収束条件を満たせば結果を返す
      if ((X - nextX).abs() < epsilon) {
        return nextX;
      }
      // 次の反復に進む
      X = nextX;
      iteration++;
    }
    // 収束しない場合はnullを返すなど、エラーハンドリングが必要です
    return null;
  }

  void changeShowType(int type) {
    state = state.copyWith(showType: type);
  }
}
