import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'risk_reward_pips_controller.g.dart';

@riverpod
class RiskPipsNotifier extends _$RiskPipsNotifier {
  @override
  int build() => 0;

  void updateState(int num) {
    state = num;
  }

}



@riverpod
class RewardPipsNotifier extends _$RiskPipsNotifier {
  @override
  int build() => 0;

  void updateState(int num) {
    state = num;
  }
}