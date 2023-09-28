import 'package:d_chart/commons/data_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'risk_reward_pips_controller.g.dart';

final ordinalGroup = [
  OrdinalGroup(
    id: '0',
    data: [
      OrdinalData(domain: 'Risk', measure: 0),
      OrdinalData(domain: 'Reward', measure: 0),
    ],
  ),
];

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

@riverpod
class TestNotifier extends _$TestNotifier {
  @override
  List<OrdinalGroup> build() {
    return [
      OrdinalGroup(
        id: '0',
        data: [
          OrdinalData(domain: 'Risk', measure: 0),
          OrdinalData(domain: 'Reward', measure: 0),
        ],
      )
    ];
  }

  // データを変更する関数
  void updateState(int num, bool isRisk) {
    // 変更前のデータ
    final oldState = state;
    // 変更後のデータ
    isRisk ? oldState[0].data[0].measure : oldState[0].data[1].measure = num;
    // データを上書き
    state = oldState;
  }

  // void deleteState() {
  //   if (state.isEmpty) {
  //     return;
  //   } else {
  //     state = state.substring(0, state.length - 1);
  //   }
  // }
}
