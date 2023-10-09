// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'risk_reward_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RiskRewardModel {
  int get riskPips => throw _privateConstructorUsedError;
  int get rewardPips => throw _privateConstructorUsedError;
  double get riskRatio => throw _privateConstructorUsedError;
  double get rewardRatio => throw _privateConstructorUsedError;
  int get requiredWinRate => throw _privateConstructorUsedError;
  List<double> get continuedLossProbability =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RiskRewardModelCopyWith<RiskRewardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RiskRewardModelCopyWith<$Res> {
  factory $RiskRewardModelCopyWith(
          RiskRewardModel value, $Res Function(RiskRewardModel) then) =
      _$RiskRewardModelCopyWithImpl<$Res, RiskRewardModel>;
  @useResult
  $Res call(
      {int riskPips,
      int rewardPips,
      double riskRatio,
      double rewardRatio,
      int requiredWinRate,
      List<double> continuedLossProbability});
}

/// @nodoc
class _$RiskRewardModelCopyWithImpl<$Res, $Val extends RiskRewardModel>
    implements $RiskRewardModelCopyWith<$Res> {
  _$RiskRewardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? riskPips = null,
    Object? rewardPips = null,
    Object? riskRatio = null,
    Object? rewardRatio = null,
    Object? requiredWinRate = null,
    Object? continuedLossProbability = null,
  }) {
    return _then(_value.copyWith(
      riskPips: null == riskPips
          ? _value.riskPips
          : riskPips // ignore: cast_nullable_to_non_nullable
              as int,
      rewardPips: null == rewardPips
          ? _value.rewardPips
          : rewardPips // ignore: cast_nullable_to_non_nullable
              as int,
      riskRatio: null == riskRatio
          ? _value.riskRatio
          : riskRatio // ignore: cast_nullable_to_non_nullable
              as double,
      rewardRatio: null == rewardRatio
          ? _value.rewardRatio
          : rewardRatio // ignore: cast_nullable_to_non_nullable
              as double,
      requiredWinRate: null == requiredWinRate
          ? _value.requiredWinRate
          : requiredWinRate // ignore: cast_nullable_to_non_nullable
              as int,
      continuedLossProbability: null == continuedLossProbability
          ? _value.continuedLossProbability
          : continuedLossProbability // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RiskRewardModelCopyWith<$Res>
    implements $RiskRewardModelCopyWith<$Res> {
  factory _$$_RiskRewardModelCopyWith(
          _$_RiskRewardModel value, $Res Function(_$_RiskRewardModel) then) =
      __$$_RiskRewardModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int riskPips,
      int rewardPips,
      double riskRatio,
      double rewardRatio,
      int requiredWinRate,
      List<double> continuedLossProbability});
}

/// @nodoc
class __$$_RiskRewardModelCopyWithImpl<$Res>
    extends _$RiskRewardModelCopyWithImpl<$Res, _$_RiskRewardModel>
    implements _$$_RiskRewardModelCopyWith<$Res> {
  __$$_RiskRewardModelCopyWithImpl(
      _$_RiskRewardModel _value, $Res Function(_$_RiskRewardModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? riskPips = null,
    Object? rewardPips = null,
    Object? riskRatio = null,
    Object? rewardRatio = null,
    Object? requiredWinRate = null,
    Object? continuedLossProbability = null,
  }) {
    return _then(_$_RiskRewardModel(
      riskPips: null == riskPips
          ? _value.riskPips
          : riskPips // ignore: cast_nullable_to_non_nullable
              as int,
      rewardPips: null == rewardPips
          ? _value.rewardPips
          : rewardPips // ignore: cast_nullable_to_non_nullable
              as int,
      riskRatio: null == riskRatio
          ? _value.riskRatio
          : riskRatio // ignore: cast_nullable_to_non_nullable
              as double,
      rewardRatio: null == rewardRatio
          ? _value.rewardRatio
          : rewardRatio // ignore: cast_nullable_to_non_nullable
              as double,
      requiredWinRate: null == requiredWinRate
          ? _value.requiredWinRate
          : requiredWinRate // ignore: cast_nullable_to_non_nullable
              as int,
      continuedLossProbability: null == continuedLossProbability
          ? _value._continuedLossProbability
          : continuedLossProbability // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc

class _$_RiskRewardModel implements _RiskRewardModel {
  const _$_RiskRewardModel(
      {this.riskPips = AppConst.zero,
      this.rewardPips = AppConst.zero,
      this.riskRatio = AppConst.doubleZero,
      this.rewardRatio = AppConst.doubleZero,
      this.requiredWinRate = AppConst.zero,
      final List<double> continuedLossProbability = const []})
      : _continuedLossProbability = continuedLossProbability;

  @override
  @JsonKey()
  final int riskPips;
  @override
  @JsonKey()
  final int rewardPips;
  @override
  @JsonKey()
  final double riskRatio;
  @override
  @JsonKey()
  final double rewardRatio;
  @override
  @JsonKey()
  final int requiredWinRate;
  final List<double> _continuedLossProbability;
  @override
  @JsonKey()
  List<double> get continuedLossProbability {
    if (_continuedLossProbability is EqualUnmodifiableListView)
      return _continuedLossProbability;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_continuedLossProbability);
  }

  @override
  String toString() {
    return 'RiskRewardModel(riskPips: $riskPips, rewardPips: $rewardPips, riskRatio: $riskRatio, rewardRatio: $rewardRatio, requiredWinRate: $requiredWinRate, continuedLossProbability: $continuedLossProbability)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RiskRewardModel &&
            (identical(other.riskPips, riskPips) ||
                other.riskPips == riskPips) &&
            (identical(other.rewardPips, rewardPips) ||
                other.rewardPips == rewardPips) &&
            (identical(other.riskRatio, riskRatio) ||
                other.riskRatio == riskRatio) &&
            (identical(other.rewardRatio, rewardRatio) ||
                other.rewardRatio == rewardRatio) &&
            (identical(other.requiredWinRate, requiredWinRate) ||
                other.requiredWinRate == requiredWinRate) &&
            const DeepCollectionEquality().equals(
                other._continuedLossProbability, _continuedLossProbability));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      riskPips,
      rewardPips,
      riskRatio,
      rewardRatio,
      requiredWinRate,
      const DeepCollectionEquality().hash(_continuedLossProbability));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RiskRewardModelCopyWith<_$_RiskRewardModel> get copyWith =>
      __$$_RiskRewardModelCopyWithImpl<_$_RiskRewardModel>(this, _$identity);
}

abstract class _RiskRewardModel implements RiskRewardModel {
  const factory _RiskRewardModel(
      {final int riskPips,
      final int rewardPips,
      final double riskRatio,
      final double rewardRatio,
      final int requiredWinRate,
      final List<double> continuedLossProbability}) = _$_RiskRewardModel;

  @override
  int get riskPips;
  @override
  int get rewardPips;
  @override
  double get riskRatio;
  @override
  double get rewardRatio;
  @override
  int get requiredWinRate;
  @override
  List<double> get continuedLossProbability;
  @override
  @JsonKey(ignore: true)
  _$$_RiskRewardModelCopyWith<_$_RiskRewardModel> get copyWith =>
      throw _privateConstructorUsedError;
}
