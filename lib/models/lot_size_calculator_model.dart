import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';
part 'lot_size_calculator_model.freezed.dart';

@freezed
class LotSizeCalculatorModel with _$LotSizeCalculatorModel {
  const factory LotSizeCalculatorModel({
    @Default(AppConst.zero) int accountBalance,
    @Default(AppConst.doubleZero) double lotSize,
    @Default(AppConst.zero) int pips,
    @Default(AppConst.strEmpty) String accountCurrency,
    @Default(AppConst.zero) int percent,
    @Default(AppConst.zero) int lot,
  }) = _LotSizeCalculatorModel;
}
