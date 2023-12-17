import 'package:lot_size_calculator_app/models/risk_reward_model.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:math';

part 'risk_reward_controller.g.dart';

@Riverpod(keepAlive: true)
class RiskRewardModelNotifier extends _$RiskRewardModelNotifier {
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

  void onCalculateRiskRewardRatio() {
    final risk = state.riskPips;
    final reward = state.rewardPips;

    if (risk == 0 || reward == 0) {
      state = state.copyWith(riskRatio: "=", rewardRatio: '=');
      return;
    }
    final roundedValue =
        double.parse((reward.toDouble() / risk.toDouble()).toStringAsFixed(1));

    String rewardRatio = roundedValue.toString();

    if (rewardRatio.toString().endsWith("0")) {
      rewardRatio = rewardRatio.substring(0, rewardRatio.length - 2);
    }

    state = state.copyWith(riskRatio: '1', rewardRatio: rewardRatio);
    onCalculateContinuedLossProbability(state.moneyRatio, rewardRatio);

    print(state.riskRatio);
    print(state.rewardRatio);
  }

  void onCalculateContinuedLossProbability(
    String moneyRatio,
    String rewardRatio,
  ) {
    double n = 1; // 資金
    double b = int.parse(moneyRatio) / 100; // 資金率

    double p = 0.35; // 勝率
    double k = double.parse(rewardRatio); // 損益比率

    double? X = solveEquation(p, k);

    print("方程式の解 X: $X");

    if (X == null) {
      print("AAAA");
      return;
    }
    num Q = pow(X, n / b);

    print("破産確率 Q(n): $Q");
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
}
