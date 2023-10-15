import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lot_size_calculator_app/services/db_model/currency_pair.dart';
import 'package:lot_size_calculator_app/services/db_model/user.dart';
part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required User user,
    required List<CurrencyPair> currencyPais,
  }) = _UserModel;
}
