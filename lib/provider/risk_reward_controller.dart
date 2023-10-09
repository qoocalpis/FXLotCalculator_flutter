import 'package:lot_size_calculator_app/models/risk_reward_model.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
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
        return;
      } else {
        state = state.copyWith(riskPips: newStateNum);
      }
    } else {
      oldStrNum = state.rewardPips.toString();
      oldStrNum += num.toString();
      newStateNum = int.tryParse(oldStrNum);
      if (newStateNum == null) {
        state = state.copyWith(rewardPips: 0);
        return;
      } else {
        state = state.copyWith(rewardPips: newStateNum);
      }
    }
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
  }

  void allDeleteState(bool isRisk) {
    state = isRisk
        ? state.copyWith(riskPips: AppConst.zero)
        : state.copyWith(rewardPips: AppConst.zero);
  }
}
