// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskElement _$$_TaskElementFromJson(Map<String, dynamic> json) =>
    _$_TaskElement(
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

Map<String, dynamic> _$$_TaskElementToJson(_$_TaskElement instance) =>
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
