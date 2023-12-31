import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';
part 'risk_reward_model.freezed.dart';

@freezed
class RiskRewardModel with _$RiskRewardModel {
  const factory RiskRewardModel({
    @Default(AppConst.zero) int riskPips,
    @Default(AppConst.zero) int rewardPips,
    @Default(AppConst.strEmpty) String riskRatio,
    @Default(AppConst.strEmpty) String rewardRatio,
    @Default(AppConst.zero) int requiredWinRate,
    @Default("2") String moneyRatio,
    @Default([]) List<String> continuedLossProbability,
    @Default(false) bool isExist,
    @Default(-1) int showType,
  }) = _RiskRewardModel;
}
