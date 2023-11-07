// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_pair_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CurrencyPairModel {
  String get currencyPair => throw _privateConstructorUsedError;
  int get rate => throw _privateConstructorUsedError;
  String get currencyCode => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;
  bool get addedToFavorite => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrencyPairModelCopyWith<CurrencyPairModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyPairModelCopyWith<$Res> {
  factory $CurrencyPairModelCopyWith(
          CurrencyPairModel value, $Res Function(CurrencyPairModel) then) =
      _$CurrencyPairModelCopyWithImpl<$Res, CurrencyPairModel>;
  @useResult
  $Res call(
      {String currencyPair,
      int rate,
      String currencyCode,
      bool selected,
      bool addedToFavorite});
}

/// @nodoc
class _$CurrencyPairModelCopyWithImpl<$Res, $Val extends CurrencyPairModel>
    implements $CurrencyPairModelCopyWith<$Res> {
  _$CurrencyPairModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencyPair = null,
    Object? rate = null,
    Object? currencyCode = null,
    Object? selected = null,
    Object? addedToFavorite = null,
  }) {
    return _then(_value.copyWith(
      currencyPair: null == currencyPair
          ? _value.currencyPair
          : currencyPair // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      addedToFavorite: null == addedToFavorite
          ? _value.addedToFavorite
          : addedToFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CurrencyPairModelCopyWith<$Res>
    implements $CurrencyPairModelCopyWith<$Res> {
  factory _$$_CurrencyPairModelCopyWith(_$_CurrencyPairModel value,
          $Res Function(_$_CurrencyPairModel) then) =
      __$$_CurrencyPairModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String currencyPair,
      int rate,
      String currencyCode,
      bool selected,
      bool addedToFavorite});
}

/// @nodoc
class __$$_CurrencyPairModelCopyWithImpl<$Res>
    extends _$CurrencyPairModelCopyWithImpl<$Res, _$_CurrencyPairModel>
    implements _$$_CurrencyPairModelCopyWith<$Res> {
  __$$_CurrencyPairModelCopyWithImpl(
      _$_CurrencyPairModel _value, $Res Function(_$_CurrencyPairModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencyPair = null,
    Object? rate = null,
    Object? currencyCode = null,
    Object? selected = null,
    Object? addedToFavorite = null,
  }) {
    return _then(_$_CurrencyPairModel(
      currencyPair: null == currencyPair
          ? _value.currencyPair
          : currencyPair // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      addedToFavorite: null == addedToFavorite
          ? _value.addedToFavorite
          : addedToFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CurrencyPairModel implements _CurrencyPairModel {
  const _$_CurrencyPairModel(
      {required this.currencyPair,
      required this.rate,
      required this.currencyCode,
      required this.selected,
      required this.addedToFavorite});

  @override
  final String currencyPair;
  @override
  final int rate;
  @override
  final String currencyCode;
  @override
  final bool selected;
  @override
  final bool addedToFavorite;

  @override
  String toString() {
    return 'CurrencyPairModel(currencyPair: $currencyPair, rate: $rate, currencyCode: $currencyCode, selected: $selected, addedToFavorite: $addedToFavorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurrencyPairModel &&
            (identical(other.currencyPair, currencyPair) ||
                other.currencyPair == currencyPair) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.addedToFavorite, addedToFavorite) ||
                other.addedToFavorite == addedToFavorite));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, currencyPair, rate, currencyCode, selected, addedToFavorite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrencyPairModelCopyWith<_$_CurrencyPairModel> get copyWith =>
      __$$_CurrencyPairModelCopyWithImpl<_$_CurrencyPairModel>(
          this, _$identity);
}

abstract class _CurrencyPairModel implements CurrencyPairModel {
  const factory _CurrencyPairModel(
      {required final String currencyPair,
      required final int rate,
      required final String currencyCode,
      required final bool selected,
      required final bool addedToFavorite}) = _$_CurrencyPairModel;

  @override
  String get currencyPair;
  @override
  int get rate;
  @override
  String get currencyCode;
  @override
  bool get selected;
  @override
  bool get addedToFavorite;
  @override
  @JsonKey(ignore: true)
  _$$_CurrencyPairModelCopyWith<_$_CurrencyPairModel> get copyWith =>
      throw _privateConstructorUsedError;
}
