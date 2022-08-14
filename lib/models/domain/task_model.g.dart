// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskModel _$$_TaskModelFromJson(Map<String, dynamic> json) => _$_TaskModel(
      id: json['id'] as String,
      isDone: json['isDone'] as bool,
      title: json['title'] as String,
      importance: $enumDecode(_$ImportanceEnumMap, json['importance']),
      createdAt: json['createdAt'] as int,
      changedAt: json['changedAt'] as int,
      lastUpdatedBy: json['lastUpdatedBy'] as String,
      deadlineTime: json['deadlineTime'] as int?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$_TaskModelToJson(_$_TaskModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isDone': instance.isDone,
      'title': instance.title,
      'importance': _$ImportanceEnumMap[instance.importance]!,
      'createdAt': instance.createdAt,
      'changedAt': instance.changedAt,
      'lastUpdatedBy': instance.lastUpdatedBy,
      'deadlineTime': instance.deadlineTime,
      'color': instance.color,
    };

const _$ImportanceEnumMap = {
  Importance.important: 'important',
  Importance.basic: 'basic',
  Importance.low: 'low',
};
