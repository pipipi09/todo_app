// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'count_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CountState {
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CountStateCopyWith<CountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountStateCopyWith<$Res> {
  factory $CountStateCopyWith(
          CountState value, $Res Function(CountState) then) =
      _$CountStateCopyWithImpl<$Res>;
  $Res call({int count});
}

/// @nodoc
class _$CountStateCopyWithImpl<$Res> implements $CountStateCopyWith<$Res> {
  _$CountStateCopyWithImpl(this._value, this._then);

  final CountState _value;
  // ignore: unused_field
  final $Res Function(CountState) _then;

  @override
  $Res call({
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_CountStateCopyWith<$Res>
    implements $CountStateCopyWith<$Res> {
  factory _$$_CountStateCopyWith(
          _$_CountState value, $Res Function(_$_CountState) then) =
      __$$_CountStateCopyWithImpl<$Res>;
  @override
  $Res call({int count});
}

/// @nodoc
class __$$_CountStateCopyWithImpl<$Res> extends _$CountStateCopyWithImpl<$Res>
    implements _$$_CountStateCopyWith<$Res> {
  __$$_CountStateCopyWithImpl(
      _$_CountState _value, $Res Function(_$_CountState) _then)
      : super(_value, (v) => _then(v as _$_CountState));

  @override
  _$_CountState get _value => super._value as _$_CountState;

  @override
  $Res call({
    Object? count = freezed,
  }) {
    return _then(_$_CountState(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CountState implements _CountState {
  const _$_CountState({this.count = 0});

  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'CountState(count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountState &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$$_CountStateCopyWith<_$_CountState> get copyWith =>
      __$$_CountStateCopyWithImpl<_$_CountState>(this, _$identity);
}

abstract class _CountState implements CountState {
  const factory _CountState({final int count}) = _$_CountState;

  @override
  int get count => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CountStateCopyWith<_$_CountState> get copyWith =>
      throw _privateConstructorUsedError;
}
