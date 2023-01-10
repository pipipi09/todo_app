// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'repeat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RepeatModel _$RepeatModelFromJson(Map<String, dynamic> json) {
  return _RepeatModel.fromJson(json);
}

/// @nodoc
mixin _$RepeatModel {
  /// id
  String? get id => throw _privateConstructorUsedError;

  /// todos tableのid
  @JsonKey(name: 'todo_id')
  String get todoId => throw _privateConstructorUsedError;

  /// 繰り返しの頻度
  /// Frequency
  @JsonKey(name: 'frequency_id')
  String get frequencyId => throw _privateConstructorUsedError;

  /// 繰り返しを行う時間
  /// 0...23
  int? get hour => throw _privateConstructorUsedError;

  /// 繰り返しを行う分
  /// 0...59
  int? get minute => throw _privateConstructorUsedError;

  /// 繰り返しを行う曜日
  /// monday...sunday = 1...7
  /// https://api.flutter.dev/flutter/dart-core/DateTime/weekday.html
  int? get weekday => throw _privateConstructorUsedError;

  /// 繰り返しを行う日
  /// 1...31
  int? get day => throw _privateConstructorUsedError;

  /// 繰り返しを行う月
  /// 1...12
  int? get month => throw _privateConstructorUsedError;

  /// end
  /// 繰り返しを行う期限
  /// UnixTime
  /// nullの場合は無期限
  int? get end => throw _privateConstructorUsedError;

  /// 作成日 UnixTime
  @JsonKey(name: 'created_at')
  int? get createdAt => throw _privateConstructorUsedError;

  /// 更新日 UnixTime
  @JsonKey(name: 'updated_at')
  int? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepeatModelCopyWith<RepeatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepeatModelCopyWith<$Res> {
  factory $RepeatModelCopyWith(
          RepeatModel value, $Res Function(RepeatModel) then) =
      _$RepeatModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      @JsonKey(name: 'todo_id') String todoId,
      @JsonKey(name: 'frequency_id') String frequencyId,
      int? hour,
      int? minute,
      int? weekday,
      int? day,
      int? month,
      int? end,
      @JsonKey(name: 'created_at') int? createdAt,
      @JsonKey(name: 'updated_at') int? updatedAt});
}

/// @nodoc
class _$RepeatModelCopyWithImpl<$Res> implements $RepeatModelCopyWith<$Res> {
  _$RepeatModelCopyWithImpl(this._value, this._then);

  final RepeatModel _value;
  // ignore: unused_field
  final $Res Function(RepeatModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? todoId = freezed,
    Object? frequencyId = freezed,
    Object? hour = freezed,
    Object? minute = freezed,
    Object? weekday = freezed,
    Object? day = freezed,
    Object? month = freezed,
    Object? end = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      todoId: todoId == freezed
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as String,
      frequencyId: frequencyId == freezed
          ? _value.frequencyId
          : frequencyId // ignore: cast_nullable_to_non_nullable
              as String,
      hour: hour == freezed
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int?,
      minute: minute == freezed
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int?,
      weekday: weekday == freezed
          ? _value.weekday
          : weekday // ignore: cast_nullable_to_non_nullable
              as int?,
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_RepeatModelCopyWith<$Res>
    implements $RepeatModelCopyWith<$Res> {
  factory _$$_RepeatModelCopyWith(
          _$_RepeatModel value, $Res Function(_$_RepeatModel) then) =
      __$$_RepeatModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      @JsonKey(name: 'todo_id') String todoId,
      @JsonKey(name: 'frequency_id') String frequencyId,
      int? hour,
      int? minute,
      int? weekday,
      int? day,
      int? month,
      int? end,
      @JsonKey(name: 'created_at') int? createdAt,
      @JsonKey(name: 'updated_at') int? updatedAt});
}

/// @nodoc
class __$$_RepeatModelCopyWithImpl<$Res> extends _$RepeatModelCopyWithImpl<$Res>
    implements _$$_RepeatModelCopyWith<$Res> {
  __$$_RepeatModelCopyWithImpl(
      _$_RepeatModel _value, $Res Function(_$_RepeatModel) _then)
      : super(_value, (v) => _then(v as _$_RepeatModel));

  @override
  _$_RepeatModel get _value => super._value as _$_RepeatModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? todoId = freezed,
    Object? frequencyId = freezed,
    Object? hour = freezed,
    Object? minute = freezed,
    Object? weekday = freezed,
    Object? day = freezed,
    Object? month = freezed,
    Object? end = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_RepeatModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      todoId: todoId == freezed
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as String,
      frequencyId: frequencyId == freezed
          ? _value.frequencyId
          : frequencyId // ignore: cast_nullable_to_non_nullable
              as String,
      hour: hour == freezed
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int?,
      minute: minute == freezed
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int?,
      weekday: weekday == freezed
          ? _value.weekday
          : weekday // ignore: cast_nullable_to_non_nullable
              as int?,
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RepeatModel extends _RepeatModel {
  const _$_RepeatModel(
      {this.id,
      @JsonKey(name: 'todo_id') required this.todoId,
      @JsonKey(name: 'frequency_id') required this.frequencyId,
      this.hour = null,
      this.minute = null,
      this.weekday = null,
      this.day = null,
      this.month = null,
      this.end = null,
      @JsonKey(name: 'created_at') this.createdAt = 0,
      @JsonKey(name: 'updated_at') this.updatedAt = 0})
      : super._();

  factory _$_RepeatModel.fromJson(Map<String, dynamic> json) =>
      _$$_RepeatModelFromJson(json);

  /// id
  @override
  final String? id;

  /// todos tableのid
  @override
  @JsonKey(name: 'todo_id')
  final String todoId;

  /// 繰り返しの頻度
  /// Frequency
  @override
  @JsonKey(name: 'frequency_id')
  final String frequencyId;

  /// 繰り返しを行う時間
  /// 0...23
  @override
  @JsonKey()
  final int? hour;

  /// 繰り返しを行う分
  /// 0...59
  @override
  @JsonKey()
  final int? minute;

  /// 繰り返しを行う曜日
  /// monday...sunday = 1...7
  /// https://api.flutter.dev/flutter/dart-core/DateTime/weekday.html
  @override
  @JsonKey()
  final int? weekday;

  /// 繰り返しを行う日
  /// 1...31
  @override
  @JsonKey()
  final int? day;

  /// 繰り返しを行う月
  /// 1...12
  @override
  @JsonKey()
  final int? month;

  /// end
  /// 繰り返しを行う期限
  /// UnixTime
  /// nullの場合は無期限
  @override
  @JsonKey()
  final int? end;

  /// 作成日 UnixTime
  @override
  @JsonKey(name: 'created_at')
  final int? createdAt;

  /// 更新日 UnixTime
  @override
  @JsonKey(name: 'updated_at')
  final int? updatedAt;

  @override
  String toString() {
    return 'RepeatModel(id: $id, todoId: $todoId, frequencyId: $frequencyId, hour: $hour, minute: $minute, weekday: $weekday, day: $day, month: $month, end: $end, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RepeatModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.todoId, todoId) &&
            const DeepCollectionEquality()
                .equals(other.frequencyId, frequencyId) &&
            const DeepCollectionEquality().equals(other.hour, hour) &&
            const DeepCollectionEquality().equals(other.minute, minute) &&
            const DeepCollectionEquality().equals(other.weekday, weekday) &&
            const DeepCollectionEquality().equals(other.day, day) &&
            const DeepCollectionEquality().equals(other.month, month) &&
            const DeepCollectionEquality().equals(other.end, end) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(todoId),
      const DeepCollectionEquality().hash(frequencyId),
      const DeepCollectionEquality().hash(hour),
      const DeepCollectionEquality().hash(minute),
      const DeepCollectionEquality().hash(weekday),
      const DeepCollectionEquality().hash(day),
      const DeepCollectionEquality().hash(month),
      const DeepCollectionEquality().hash(end),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$$_RepeatModelCopyWith<_$_RepeatModel> get copyWith =>
      __$$_RepeatModelCopyWithImpl<_$_RepeatModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RepeatModelToJson(this);
  }
}

abstract class _RepeatModel extends RepeatModel {
  const factory _RepeatModel(
      {final String? id,
      @JsonKey(name: 'todo_id') required final String todoId,
      @JsonKey(name: 'frequency_id') required final String frequencyId,
      final int? hour,
      final int? minute,
      final int? weekday,
      final int? day,
      final int? month,
      final int? end,
      @JsonKey(name: 'created_at') final int? createdAt,
      @JsonKey(name: 'updated_at') final int? updatedAt}) = _$_RepeatModel;
  const _RepeatModel._() : super._();

  factory _RepeatModel.fromJson(Map<String, dynamic> json) =
      _$_RepeatModel.fromJson;

  @override

  /// id
  String? get id => throw _privateConstructorUsedError;
  @override

  /// todos tableのid
  @JsonKey(name: 'todo_id')
  String get todoId => throw _privateConstructorUsedError;
  @override

  /// 繰り返しの頻度
  /// Frequency
  @JsonKey(name: 'frequency_id')
  String get frequencyId => throw _privateConstructorUsedError;
  @override

  /// 繰り返しを行う時間
  /// 0...23
  int? get hour => throw _privateConstructorUsedError;
  @override

  /// 繰り返しを行う分
  /// 0...59
  int? get minute => throw _privateConstructorUsedError;
  @override

  /// 繰り返しを行う曜日
  /// monday...sunday = 1...7
  /// https://api.flutter.dev/flutter/dart-core/DateTime/weekday.html
  int? get weekday => throw _privateConstructorUsedError;
  @override

  /// 繰り返しを行う日
  /// 1...31
  int? get day => throw _privateConstructorUsedError;
  @override

  /// 繰り返しを行う月
  /// 1...12
  int? get month => throw _privateConstructorUsedError;
  @override

  /// end
  /// 繰り返しを行う期限
  /// UnixTime
  /// nullの場合は無期限
  int? get end => throw _privateConstructorUsedError;
  @override

  /// 作成日 UnixTime
  @JsonKey(name: 'created_at')
  int? get createdAt => throw _privateConstructorUsedError;
  @override

  /// 更新日 UnixTime
  @JsonKey(name: 'updated_at')
  int? get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RepeatModelCopyWith<_$_RepeatModel> get copyWith =>
      throw _privateConstructorUsedError;
}
