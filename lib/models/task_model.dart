import 'task_element_response.dart';
import 'task_hive.dart';

class TaskModel {
  String id;
  bool isDone;
  String title;
  String priority;
  int createdAt;
  int changedAt;
  String lastUpdatedBy;
  int? deadlineTime;
  String? color;

  TaskModel({
    required this.id,
    required this.isDone,
    required this.title,
    required this.priority,
    required this.createdAt,
    required this.changedAt,
    required this.lastUpdatedBy,
    this.deadlineTime,
    this.color,
  });

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

  factory TaskModel.fromResponse(TaskElementResponse task) {
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
