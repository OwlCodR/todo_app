// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskResponse _$$_TaskResponseFromJson(Map<String, dynamic> json) =>
    _$_TaskResponse(
      status: json['status'] as String,
      task: ElementResponse.fromJson(json['element'] as Map<String, dynamic>),
      revision: json['revision'] as int,
    );

Map<String, dynamic> _$$_TaskResponseToJson(_$_TaskResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'element': instance.task,
      'revision': instance.revision,
    };
