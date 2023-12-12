// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lot_size_calculator_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LotSizeCalculatorModel {
  int get accountBalance => throw _privateConstructorUsedError;
  double get lotSize => throw _privateConstructorUsedError;
  int get pips => throw _privateConstructorUsedError;
  String get accountCurrency => throw _privateConstructorUsedError;
  int get percent => throw _privateConstructorUsedError;
  int get lot => throw _privateConstructorUsedError;
  bool get isEnable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LotSizeCalculatorModelCopyWith<LotSizeCalculatorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LotSizeCalculatorModelCopyWith<$Res> {
  factory $LotSizeCalculatorModelCopyWith(LotSizeCalculatorModel value,
          $Res Function(LotSizeCalculatorModel) then) =
      _$LotSizeCalculatorModelCopyWithImpl<$Res, LotSizeCalculatorModel>;
  @useResult
  $Res call(
      {int accountBalance,
      double lotSize,
      int pips,
      String accountCurrency,
      int percent,
      int lot,
      bool isEnable});
}

/// @nodoc
class _$LotSizeCalculatorModelCopyWithImpl<$Res,
        $Val extends LotSizeCalculatorModel>
    implements $LotSizeCalculatorModelCopyWith<$Res> {
  _$LotSizeCalculatorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountBalance = null,
    Object? lotSize = null,
    Object? pips = null,
    Object? accountCurrency = null,
    Object? percent = null,
    Object? lot = null,
    Object? isEnable = null,
  }) {
    return _then(_value.copyWith(
      accountBalance: null == accountBalance
          ? _value.accountBalance
          : accountBalance // ignore: cast_nullable_to_non_nullable
              as int,
      lotSize: null == lotSize
          ? _value.lotSize
          : lotSize // ignore: cast_nullable_to_non_nullable
              as double,
      pips: null == pips
          ? _value.pips
          : pips // ignore: cast_nullable_to_non_nullable
              as int,
      accountCurrency: null == accountCurrency
          ? _value.accountCurrency
          : accountCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      percent: null == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as int,
      lot: null == lot
          ? _value.lot
          : lot // ignore: cast_nullable_to_non_nullable
              as int,
      isEnable: null == isEnable
          ? _value.isEnable
          : isEnable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LotSizeCalculatorModelCopyWith<$Res>
    implements $LotSizeCalculatorModelCopyWith<$Res> {
  factory _$$_LotSizeCalculatorModelCopyWith(_$_LotSizeCalculatorModel value,
          $Res Function(_$_LotSizeCalculatorModel) then) =
      __$$_LotSizeCalculatorModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int accountBalance,
      double lotSize,
      int pips,
      String accountCurrency,
      int percent,
      int lot,
      bool isEnable});
}

/// @nodoc
class __$$_LotSizeCalculatorModelCopyWithImpl<$Res>
    extends _$LotSizeCalculatorModelCopyWithImpl<$Res,
        _$_LotSizeCalculatorModel>
    implements _$$_LotSizeCalculatorModelCopyWith<$Res> {
  __$$_LotSizeCalculatorModelCopyWithImpl(_$_LotSizeCalculatorModel _value,
      $Res Function(_$_LotSizeCalculatorModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountBalance = null,
    Object? lotSize = null,
    Object? pips = null,
    Object? accountCurrency = null,
    Object? percent = null,
    Object? lot = null,
    Object? isEnable = null,
  }) {
    return _then(_$_LotSizeCalculatorModel(
      accountBalance: null == accountBalance
          ? _value.accountBalance
          : accountBalance // ignore: cast_nullable_to_non_nullable
              as int,
      lotSize: null == lotSize
          ? _value.lotSize
          : lotSize // ignore: cast_nullable_to_non_nullable
              as double,
      pips: null == pips
          ? _value.pips
          : pips // ignore: cast_nullable_to_non_nullable
              as int,
      accountCurrency: null == accountCurrency
          ? _value.accountCurrency
          : accountCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      percent: null == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as int,
      lot: null == lot
          ? _value.lot
          : lot // ignore: cast_nullable_to_non_nullable
              as int,
      isEnable: null == isEnable
          ? _value.isEnable
          : isEnable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LotSizeCalculatorModel implements _LotSizeCalculatorModel {
  const _$_LotSizeCalculatorModel(
      {this.accountBalance = AppConst.zero,
      this.lotSize = AppConst.doubleZero,
      this.pips = AppConst.zero,
      this.accountCurrency = AppConst.strEmpty,
      this.percent = AppConst.zero,
      this.lot = AppConst.zero,
      this.isEnable = false});

  @override
  @JsonKey()
  final int accountBalance;
  @override
  @JsonKey()
  final double lotSize;
  @override
  @JsonKey()
  final int pips;
  @override
  @JsonKey()
  final String accountCurrency;
  @override
  @JsonKey()
  final int percent;
  @override
  @JsonKey()
  final int lot;
  @override
  @JsonKey()
  final bool isEnable;

  @override
  String toString() {
    return 'LotSizeCalculatorModel(accountBalance: $accountBalance, lotSize: $lotSize, pips: $pips, accountCurrency: $accountCurrency, percent: $percent, lot: $lot, isEnable: $isEnable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LotSizeCalculatorModel &&
            (identical(other.accountBalance, accountBalance) ||
                other.accountBalance == accountBalance) &&
            (identical(other.lotSize, lotSize) || other.lotSize == lotSize) &&
            (identical(other.pips, pips) || other.pips == pips) &&
            (identical(other.accountCurrency, accountCurrency) ||
                other.accountCurrency == accountCurrency) &&
            (identical(other.percent, percent) || other.percent == percent) &&
            (identical(other.lot, lot) || other.lot == lot) &&
            (identical(other.isEnable, isEnable) ||
                other.isEnable == isEnable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountBalance, lotSize, pips,
      accountCurrency, percent, lot, isEnable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LotSizeCalculatorModelCopyWith<_$_LotSizeCalculatorModel> get copyWith =>
      __$$_LotSizeCalculatorModelCopyWithImpl<_$_LotSizeCalculatorModel>(
          this, _$identity);
}

abstract class _LotSizeCalculatorModel implements LotSizeCalculatorModel {
  const factory _LotSizeCalculatorModel(
      {final int accountBalance,
      final double lotSize,
      final int pips,
      final String accountCurrency,
      final int percent,
      final int lot,
      final bool isEnable}) = _$_LotSizeCalculatorModel;

  @override
  int get accountBalance;
  @override
  double get lotSize;
  @override
  int get pips;
  @override
  String get accountCurrency;
  @override
  int get percent;
  @override
  int get lot;
  @override
  bool get isEnable;
  @override
  @JsonKey(ignore: true)
  _$$_LotSizeCalculatorModelCopyWith<_$_LotSizeCalculatorModel> get copyWith =>
      throw _privateConstructorUsedError;
}
