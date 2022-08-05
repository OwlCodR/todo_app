import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/models/task_hive.dart';

class TasksLocalDatasource {
  static const tasksAppBox = 'TASKS_APP_BOX';
  static TasksLocalDatasource? _instance;

  TasksLocalDatasource._internal(this._box);
  TasksLocalDatasource({required tasksBox}) : _box = tasksBox;

  final Box<TaskHive> _box;

  static TasksLocalDatasource getInstance(Box<TaskHive> box) {
    // Making it Singleton
    _instance ??= TasksLocalDatasource._internal(box);
    return _instance!;
  }

  void createTask(TaskHive newTask) {
    _box.add(newTask);
  }

  void deleteTask(String id) {
    _box.delete(_box.values.where((task) => task.id == id).first);
  }

  TaskHive getTask(String id) {
    return _box.values.where((task) => task.id == id).first;
  }

  List<TaskHive> getList() {
    return _box.values.toList();
  }

  void updateTask(TaskHive newTask) {
    final oldTask = _box.values.where((task) => task.id == newTask.id).first;
    _box.put(oldTask.key, newTask);
  }

  void updateList(List<TaskHive> tasks) {
    _box.clear();
    _box.addAll(tasks);
  }
}
