import 'package:freezed_annotation/freezed_annotation.dart';
part 'currency_pair_model.freezed.dart';

@freezed
class CurrencyPairModel with _$CurrencyPairModel {
  const factory CurrencyPairModel({
    required String currencyPair,
    required String rate,
    required String currencyCode,
    required String currencyPairName,
    required bool selected,
    required bool addedToFavorite,
  }) = _CurrencyPairModel;
}
