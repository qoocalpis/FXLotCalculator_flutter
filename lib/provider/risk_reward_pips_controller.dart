import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'risk_reward_pips_controller.g.dart';

@Riverpod(keepAlive: true)
class RiskPipsNotifier extends _$RiskPipsNotifier {
  @override
  int build() => 0;

  void updateState(int num) {
    String oldState = state.toString();
    oldState += num.toString();
    var newState = int.tryParse(oldState);
    if (newState == null) {
      state = 0;
    } else {
      state = newState;
    }
  }

  void deleteState() {
    String oldState = state.toString();
    if (oldState.length <= 1) {
      state = 0;
    } else {
      final newState = oldState.substring(0, oldState.length - 1);
      state = int.tryParse(newState)!;
    }
  }

  void allDeleteState() {
    state = 0;
  }
}

@Riverpod(keepAlive: true)
class RewardPipsNotifier extends _$RewardPipsNotifier {
  @override
  int build() => 0;

  void updateState(int num) {
    String oldState = state.toString();
    oldState += num.toString();
    var newState = int.tryParse(oldState);
    if (newState == null) {
      state = 0;
    } else {
      state = newState;
    }
  }

  void deleteState() {
    String oldState = state.toString();
    if (oldState.length <= 1) {
      state = 0;
    } else {
      final newState = oldState.substring(0, oldState.length - 1);
      state = int.tryParse(newState)!;
    }
  }

  void allDeleteState() {
    state = 0;
  }
}
