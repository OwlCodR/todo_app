// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tasks _$$_TasksFromJson(Map<String, dynamic> json) => _$_Tasks(
      status: json['status'] as String,
      tasks: (json['list'] as List<dynamic>)
          .map((e) => TaskElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      revision: json['revision'] as int,
    );

Map<String, dynamic> _$$_TasksToJson(_$_Tasks instance) => <String, dynamic>{
      'status': instance.status,
      'list': instance.tasks,
      'revision': instance.revision,
    };
