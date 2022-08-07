// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskModel _$$_TaskModelFromJson(Map<String, dynamic> json) => _$_TaskModel(
      id: json['id'] as String,
      isDone: json['done'] as bool,
      title: json['text'] as String,
      priority: json['importance'] as String,
      createdAt: json['created_at'] as int,
      changedAt: json['changed_at'] as int,
      lastUpdatedBy: json['last_updated_by'] as String,
      deadlineTime: json['deadline'] as int?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$_TaskModelToJson(_$_TaskModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'done': instance.isDone,
      'text': instance.title,
      'importance': instance.priority,
      'created_at': instance.createdAt,
      'changed_at': instance.changedAt,
      'last_updated_by': instance.lastUpdatedBy,
      'deadline': instance.deadlineTime,
      'color': instance.color,
    };
