import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/models/task_hive.dart';

import '../utils/logger.dart';

class TasksLocalDatasource {
  static const tasksAppBox = 'TASKS_APP_BOX';

  final _box = Hive.box<TaskHive>(tasksAppBox);

  void createTask(TaskHive newTask) {
    log.d('[$runtimeType] createTask($newTask)');
    _box.add(newTask);
  }

  void deleteTask(String id) {
    log.d('[$runtimeType] deleteTask($id)');

    final task = _getTaskById(id);
    if (task == null) return;

    _box.delete(task);
  }

  TaskHive getTask(String id) {
    log.d('[$runtimeType] getTask($id)');
    return _box.values.where((task) => task.id == id).first;
  }

  List<TaskHive> getTasks() {
    log.d('[$runtimeType] getTasks()');
    return _box.values.toList();
  }

  void updateTask(TaskHive newTask) {
    log.d('[$runtimeType] updateTask($newTask)');

    final task = _getTaskById(newTask.id);
    if (task == null) return;

    _box.put(task.key, newTask);
  }

  void updateList(List<TaskHive> tasks) {
    log.d('[$runtimeType] updateList($tasks)');
    _box.clear();
    _box.addAll(tasks);
  }

  TaskHive? _getTaskById(String id) {
    final tasks = _box.values.where((task) => task.id == id);
    return tasks.isEmpty ? null : tasks.first;
  }
}
