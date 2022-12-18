// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repeat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RepeatModel _$$_RepeatModelFromJson(Map<String, dynamic> json) =>
    _$_RepeatModel(
      id: json['id'] as String?,
      todoId: json['todo_id'] as String,
      frequencyId: json['frequency_id'] as String,
      hour: json['hour'] as int? ?? null,
      minute: json['minute'] as int? ?? null,
      weekday: json['weekday'] as int? ?? null,
      day: json['day'] as int? ?? null,
      month: json['month'] as int? ?? null,
      end: json['end'] as int? ?? null,
      createdAt: json['created_at'] as int? ?? 0,
      updatedAt: json['updated_at'] as int? ?? 0,
    );

Map<String, dynamic> _$$_RepeatModelToJson(_$_RepeatModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'todo_id': instance.todoId,
      'frequency_id': instance.frequencyId,
      'hour': instance.hour,
      'minute': instance.minute,
      'weekday': instance.weekday,
      'day': instance.day,
      'month': instance.month,
      'end': instance.end,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
