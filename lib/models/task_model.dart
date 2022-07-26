import 'package:freezed_annotation/freezed_annotation.dart';

import '../constants/app_paths.dart';
import 'task_hive.dart';

part 'task_model.freezed.dart'; // Associates our class with the code generated by Freezed
part 'task_model.g.dart'; // Makes class serializable

@freezed
class TaskModel with _$TaskModel {
  static String lowPriority = 'low';
  static String basicPriority = 'basic';
  static String importantPriority = 'important';

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

extension TaskModelExtesion on TaskModel {
  String? get prefixPath {
    if (!isDone && priority == TaskModel.importantPriority) {
      return AppPaths.prefixImportnantPriority;
    }

    if (!isDone && priority == TaskModel.lowPriority) {
      return AppPaths.prefixLowPriority;
    }

    return null;
  }

  String get checkboxPath {
    if (isDone) {
      return AppPaths.checked;
    } else if (priority == TaskModel.importantPriority) {
      return AppPaths.uncheckedImportant;
    }

    return AppPaths.unchecked;
  }
}
