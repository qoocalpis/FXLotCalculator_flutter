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

  // void deleteState() {
  //   if (state.isEmpty) {
  //     return;
  //   } else {
  //     state = state.substring(0, state.length - 1);
  //   }
  // }
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

  // void deleteState() {
  //   if (state.isEmpty) {
  //     return;
  //   } else {
  //     state = state.substring(0, state.length - 1);
  //   }
  // }
}
