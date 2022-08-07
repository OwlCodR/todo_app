import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/models/task_hive.dart';

import '../utils/logger.dart';

class TasksLocalDatasource {
  static const tasksAppBox = 'TASKS_APP_BOX';
  static TasksLocalDatasource? _instance;

  TasksLocalDatasource._constructor();

  final Box<TaskHive> _box = Hive.box(tasksAppBox);

  static TasksLocalDatasource getInstance() {
    // Making it Singleton
    _instance ??= TasksLocalDatasource._constructor();
    return _instance!;
  }

  void createTask(TaskHive newTask) {
    log.d('[TasksLocalDatasource] createTask($newTask)');
    _box.add(newTask);
  }

  void deleteTask(String id) {
    log.d('[TasksLocalDatasource] deleteTask($id)');
    _box.delete(_box.values.where((task) => task.id == id).first);
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

    final list = _box.values.where((task) => task.id == newTask.id);
    if (list.isEmpty) return;

    final oldTask = list.first;
    _box.put(oldTask.key, newTask);
  }

  void updateList(List<TaskHive> tasks) {
    log.d('[TasksLocalDatasource] updateList($tasks)');
    _box.clear();
    _box.addAll(tasks);
  }
}
