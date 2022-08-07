import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/models/task_hive.dart';

import '../utils/logger.dart';

class TasksLocalDatasource {
  static const tasksAppBox = 'TASKS_APP_BOX';

  final _box = Hive.box<TaskHive>(tasksAppBox);

  void createTask(TaskHive newTask) {
    log.d('[TasksLocalDatasource] createTask($newTask)');
    _box.add(newTask);
  }

  void deleteTask(String id) {
    log.d('[TasksLocalDatasource] deleteTask($id)');

    final task = _getTaskById(id);
    if (task == null) return;

    _box.delete(task);
  }

  TaskHive getTask(String id) {
    log.d('[TasksLocalDatasource] getTask($id)');
    return _box.values.where((task) => task.id == id).first;
  }

  List<TaskHive> getList() {
    log.d('[TasksLocalDatasource] getList()');
    return _box.values.toList();
  }

  void updateTask(TaskHive newTask) {
    log.d('[TasksLocalDatasource] updateTask($newTask)');

    final task = _getTaskById(newTask.id);
    if (task == null) return;

    _box.put(task.key, newTask);
  }

  void updateList(List<TaskHive> tasks) {
    log.d('[TasksLocalDatasource] updateList($tasks)');
    _box.clear();
    _box.addAll(tasks);
  }

  TaskHive? _getTaskById(String id) {
    final tasks = _box.values.where((task) => task.id == id);
    if (tasks.isEmpty) {
      return null;
    } else {
      return tasks.first;
    }
  }
}
