// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_screen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainScreenModel {
  String get screenTitle => throw _privateConstructorUsedError;
  int get selectedScreenIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainScreenModelCopyWith<MainScreenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainScreenModelCopyWith<$Res> {
  factory $MainScreenModelCopyWith(
          MainScreenModel value, $Res Function(MainScreenModel) then) =
      _$MainScreenModelCopyWithImpl<$Res, MainScreenModel>;
  @useResult
  $Res call({String screenTitle, int selectedScreenIndex});
}

/// @nodoc
class _$MainScreenModelCopyWithImpl<$Res, $Val extends MainScreenModel>
    implements $MainScreenModelCopyWith<$Res> {
  _$MainScreenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenTitle = null,
    Object? selectedScreenIndex = null,
  }) {
    return _then(_value.copyWith(
      screenTitle: null == screenTitle
          ? _value.screenTitle
          : screenTitle // ignore: cast_nullable_to_non_nullable
              as String,
      selectedScreenIndex: null == selectedScreenIndex
          ? _value.selectedScreenIndex
          : selectedScreenIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainScreenModelImplCopyWith<$Res>
    implements $MainScreenModelCopyWith<$Res> {
  factory _$$MainScreenModelImplCopyWith(_$MainScreenModelImpl value,
          $Res Function(_$MainScreenModelImpl) then) =
      __$$MainScreenModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String screenTitle, int selectedScreenIndex});
}

/// @nodoc
class __$$MainScreenModelImplCopyWithImpl<$Res>
    extends _$MainScreenModelCopyWithImpl<$Res, _$MainScreenModelImpl>
    implements _$$MainScreenModelImplCopyWith<$Res> {
  __$$MainScreenModelImplCopyWithImpl(
      _$MainScreenModelImpl _value, $Res Function(_$MainScreenModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenTitle = null,
    Object? selectedScreenIndex = null,
  }) {
    return _then(_$MainScreenModelImpl(
      screenTitle: null == screenTitle
          ? _value.screenTitle
          : screenTitle // ignore: cast_nullable_to_non_nullable
              as String,
      selectedScreenIndex: null == selectedScreenIndex
          ? _value.selectedScreenIndex
          : selectedScreenIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MainScreenModelImpl implements _MainScreenModel {
  const _$MainScreenModelImpl(
      {required this.screenTitle, required this.selectedScreenIndex});

  @override
  final String screenTitle;
  @override
  final int selectedScreenIndex;

  @override
  String toString() {
    return 'MainScreenModel(screenTitle: $screenTitle, selectedScreenIndex: $selectedScreenIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainScreenModelImpl &&
            (identical(other.screenTitle, screenTitle) ||
                other.screenTitle == screenTitle) &&
            (identical(other.selectedScreenIndex, selectedScreenIndex) ||
                other.selectedScreenIndex == selectedScreenIndex));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, screenTitle, selectedScreenIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainScreenModelImplCopyWith<_$MainScreenModelImpl> get copyWith =>
      __$$MainScreenModelImplCopyWithImpl<_$MainScreenModelImpl>(
          this, _$identity);
}

abstract class _MainScreenModel implements MainScreenModel {
  const factory _MainScreenModel(
      {required final String screenTitle,
      required final int selectedScreenIndex}) = _$MainScreenModelImpl;

  @override
  String get screenTitle;
  @override
  int get selectedScreenIndex;
  @override
  @JsonKey(ignore: true)
  _$$MainScreenModelImplCopyWith<_$MainScreenModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
