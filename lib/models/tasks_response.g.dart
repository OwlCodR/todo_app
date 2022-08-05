// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TasksResponse _$$_TasksResponseFromJson(Map<String, dynamic> json) =>
    _$_TasksResponse(
      status: json['status'] as String,
      tasks: (json['list'] as List<dynamic>)
          .map((e) => TaskElementResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      revision: json['revision'] as int,
    );

Map<String, dynamic> _$$_TasksResponseToJson(_$_TasksResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'list': instance.tasks,
      'revision': instance.revision,
    };
