// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'task_hive.dart';

part 'task_model.freezed.dart'; // Associates our `main.dart` with the code generated by Freezed
part 'task_model.g.dart'; // Makes class serializable

@freezed
class TaskModel with _$TaskModel {
  factory TaskModel({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'done') required bool isDone,
    @JsonKey(name: 'text') required String title,
    @JsonKey(name: 'importance') required String priority,
    @JsonKey(name: 'created_at') required int createdAt,
    @JsonKey(name: 'changed_at') required int changedAt,
    @JsonKey(name: 'last_updated_by') required String lastUpdatedBy,
    @JsonKey(name: 'deadline') int? deadlineTime,
    @JsonKey(name: 'color') String? color,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, Object?> json) =>
      _$TaskModelFromJson(json);

  factory TaskModel.fromHive(TaskHive task) {
    return TaskModel(
      id: task.id,
      isDone: task.isDone,
      title: task.title,
      priority: task.priority,
      createdAt: task.createdAt,
      changedAt: task.changedAt,
      lastUpdatedBy: task.lastUpdatedBy,
      deadlineTime: task.deadlineTime,
      color: task.color,
    );
  }
}
