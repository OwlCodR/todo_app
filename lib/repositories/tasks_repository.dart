import 'package:todo_app/datasources/tasks_local_datasource.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/repositories/base_repository.dart';

import '../datasources/tasks_remote_datasource.dart';
import '../models/task_hive.dart';

class TaskRepository implements BaseRepository {
  TasksLocalDatasource _local;
  TasksRemoteDatasource _remote;

  TaskRepository(this._local, this._remote);

  @override
  void createTask(TaskModel newTask) {
    _local.createTask(TaskHive.fromModel(newTask));
  }

  @override
  void deleteTask(String id) {
    _local.deleteTask(id);
  }

  @override
  List<TaskModel> getList() {
    return _local.getList().map((e) => TaskModel.fromHive(e)).toList();
  }

  @override
  TaskModel getTask(String id) {
    return TaskModel.fromHive(_local.getTask(id));
  }

  @override
  void updateList(List<TaskModel> tasks) {
    return _local.updateList(tasks.map((e) => TaskHive.fromModel(e)).toList());
  }

  @override
  TaskModel updateTask(TaskModel newTask) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
