// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'completed_todo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompletedTodoModel _$CompletedTodoModelFromJson(Map<String, dynamic> json) {
  return _CompletedTodoModel.fromJson(json);
}

/// @nodoc
mixin _$CompletedTodoModel {
  /// id
  String? get id => throw _privateConstructorUsedError;

  /// 完了した日付 UnixTime
  int get date => throw _privateConstructorUsedError;

  /// todos tableのid
  @JsonKey(name: 'todo_id')
  String get todoId => throw _privateConstructorUsedError;

  /// 作成日 UnixTime
  @JsonKey(name: 'created_at')
  int? get createdAt => throw _privateConstructorUsedError;

  /// 更新日 UnixTime
  @JsonKey(name: 'updated_at')
  int? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompletedTodoModelCopyWith<CompletedTodoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompletedTodoModelCopyWith<$Res> {
  factory $CompletedTodoModelCopyWith(
          CompletedTodoModel value, $Res Function(CompletedTodoModel) then) =
      _$CompletedTodoModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      int date,
      @JsonKey(name: 'todo_id') String todoId,
      @JsonKey(name: 'created_at') int? createdAt,
      @JsonKey(name: 'updated_at') int? updatedAt});
}

/// @nodoc
class _$CompletedTodoModelCopyWithImpl<$Res>
    implements $CompletedTodoModelCopyWith<$Res> {
  _$CompletedTodoModelCopyWithImpl(this._value, this._then);

  final CompletedTodoModel _value;
  // ignore: unused_field
  final $Res Function(CompletedTodoModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? todoId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      todoId: todoId == freezed
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_CompletedTodoModelCopyWith<$Res>
    implements $CompletedTodoModelCopyWith<$Res> {
  factory _$$_CompletedTodoModelCopyWith(_$_CompletedTodoModel value,
          $Res Function(_$_CompletedTodoModel) then) =
      __$$_CompletedTodoModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      int date,
      @JsonKey(name: 'todo_id') String todoId,
      @JsonKey(name: 'created_at') int? createdAt,
      @JsonKey(name: 'updated_at') int? updatedAt});
}

/// @nodoc
class __$$_CompletedTodoModelCopyWithImpl<$Res>
    extends _$CompletedTodoModelCopyWithImpl<$Res>
    implements _$$_CompletedTodoModelCopyWith<$Res> {
  __$$_CompletedTodoModelCopyWithImpl(
      _$_CompletedTodoModel _value, $Res Function(_$_CompletedTodoModel) _then)
      : super(_value, (v) => _then(v as _$_CompletedTodoModel));

  @override
  _$_CompletedTodoModel get _value => super._value as _$_CompletedTodoModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? todoId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_CompletedTodoModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      todoId: todoId == freezed
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$_CompletedTodoModel extends _CompletedTodoModel {
  const _$_CompletedTodoModel(
      {this.id,
      required this.date,
      @JsonKey(name: 'todo_id') required this.todoId,
      @JsonKey(name: 'created_at') this.createdAt = 0,
      @JsonKey(name: 'updated_at') this.updatedAt = 0})
      : super._();

  factory _$_CompletedTodoModel.fromJson(Map<String, dynamic> json) =>
      _$$_CompletedTodoModelFromJson(json);

  /// id
  @override
  final String? id;

  /// 完了した日付 UnixTime
  @override
  final int date;

  /// todos tableのid
  @override
  @JsonKey(name: 'todo_id')
  final String todoId;

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
    return 'CompletedTodoModel(id: $id, date: $date, todoId: $todoId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompletedTodoModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.todoId, todoId) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(todoId),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$$_CompletedTodoModelCopyWith<_$_CompletedTodoModel> get copyWith =>
      __$$_CompletedTodoModelCopyWithImpl<_$_CompletedTodoModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompletedTodoModelToJson(this);
  }
}

abstract class _CompletedTodoModel extends CompletedTodoModel {
  const factory _CompletedTodoModel(
          {final String? id,
          required final int date,
          @JsonKey(name: 'todo_id') required final String todoId,
          @JsonKey(name: 'created_at') final int? createdAt,
          @JsonKey(name: 'updated_at') final int? updatedAt}) =
      _$_CompletedTodoModel;
  const _CompletedTodoModel._() : super._();

  factory _CompletedTodoModel.fromJson(Map<String, dynamic> json) =
      _$_CompletedTodoModel.fromJson;

  @override

  /// id
  String? get id => throw _privateConstructorUsedError;
  @override

  /// 完了した日付 UnixTime
  int get date => throw _privateConstructorUsedError;
  @override

  /// todos tableのid
  @JsonKey(name: 'todo_id')
  String get todoId => throw _privateConstructorUsedError;
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
  _$$_CompletedTodoModelCopyWith<_$_CompletedTodoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
