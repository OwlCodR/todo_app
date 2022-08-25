// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TasksRequest _$$_TasksRequestFromJson(Map<String, dynamic> json) =>
    _$_TasksRequest(
      tasks: (json['list'] as List<dynamic>)
          .map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TasksRequestToJson(_$_TasksRequest instance) =>
    <String, dynamic>{
      'list': instance.tasks,
    };
