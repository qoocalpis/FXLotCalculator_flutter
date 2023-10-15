// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserModel {
  User get user => throw _privateConstructorUsedError;
  List<CurrencyPair> get currencyPais => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call({User user, List<CurrencyPair> currencyPais});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? currencyPais = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      currencyPais: null == currencyPais
          ? _value.currencyPais
          : currencyPais // ignore: cast_nullable_to_non_nullable
              as List<CurrencyPair>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user, List<CurrencyPair> currencyPais});
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? currencyPais = null,
  }) {
    return _then(_$_UserModel(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      currencyPais: null == currencyPais
          ? _value._currencyPais
          : currencyPais // ignore: cast_nullable_to_non_nullable
              as List<CurrencyPair>,
    ));
  }
}

/// @nodoc

class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {required this.user, required final List<CurrencyPair> currencyPais})
      : _currencyPais = currencyPais;

  @override
  final User user;
  final List<CurrencyPair> _currencyPais;
  @override
  List<CurrencyPair> get currencyPais {
    if (_currencyPais is EqualUnmodifiableListView) return _currencyPais;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currencyPais);
  }

  @override
  String toString() {
    return 'UserModel(user: $user, currencyPais: $currencyPais)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._currencyPais, _currencyPais));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, user, const DeepCollectionEquality().hash(_currencyPais));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {required final User user,
      required final List<CurrencyPair> currencyPais}) = _$_UserModel;

  @override
  User get user;
  @override
  List<CurrencyPair> get currencyPais;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
