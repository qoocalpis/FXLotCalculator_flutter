import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'risk_reward_pips_controller.g.dart';

@riverpod
class RiskPipsNotifier extends _$RiskPipsNotifier {
  @override
  String build() => '';

  void updateState(int num) {
    state += num.toString();
  }

  void deleteState() {
    if (state.isEmpty) {
      return;
    } else {
      state = state.substring(0, state.length - 1);
    }
  }
}

@riverpod
class RewardPipsNotifier extends _$RewardPipsNotifier {
  @override
  String build() => '';

  void updateState(int num) {
    state += num.toString();
  }

  void deleteState() {
    if (state.isEmpty) {
      return;
    } else {
      state = state.substring(0, state.length - 1);
    }
  }
}
