// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompletedTodoModel _$$_CompletedTodoModelFromJson(
        Map<String, dynamic> json) =>
    _$_CompletedTodoModel(
      id: json['id'] as String?,
      date: json['date'] as int,
      todoId: json['todo_id'] as String,
      createdAt: json['created_at'] as int? ?? 0,
      updatedAt: json['updated_at'] as int? ?? 0,
    );

Map<String, dynamic> _$$_CompletedTodoModelToJson(
        _$_CompletedTodoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'todo_id': instance.todoId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
