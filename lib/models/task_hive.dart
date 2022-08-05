import 'package:hive/hive.dart';

part 'task_hive.g.dart';

@HiveType(typeId: 0)
class TaskHive extends HiveObject {
  TaskHive({
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

  @HiveField(0)
  String id;

  @HiveField(1)
  bool isDone;

  @HiveField(2)
  String title;

  @HiveField(3)
  String priority;

  @HiveField(4)
  int createdAt;

  @HiveField(5)
  int changedAt;

  @HiveField(6)
  String lastUpdatedBy;

  @HiveField(7)
  int? deadlineTime;

  @HiveField(8)
  String? color;
}
