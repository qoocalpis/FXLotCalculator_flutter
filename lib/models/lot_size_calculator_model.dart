import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';
part 'lot_size_calculator_model.freezed.dart';

@freezed
class LotSizeCalculatorModel with _$LotSizeCalculatorModel {
  const factory LotSizeCalculatorModel({
    @Default(AppConst.zero) int accountBalance,
    @Default(AppConst.strEmpty) String lotSize,
    @Default(AppConst.zero) int pips,
    @Default(AppConst.zero) int percent,
    @Default(false) bool isEnable,
    @Default(false) bool isKeyboardOpen,
    @Default(AppConst.zero) int lossAllowableAmount,
  }) = _LotSizeCalculatorModel;
}
