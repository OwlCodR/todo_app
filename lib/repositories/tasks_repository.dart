import 'package:flutter/foundation.dart';

import '../datasources/revision_local_datasource.dart';
import '../datasources/tasks_local_datasource.dart';
import '../datasources/tasks_remote_datasource.dart';
import '../models/data/local/task_hive.dart';
import '../models/domain/task_model.dart';
import '../utils/json_pretty_print.dart';
import '../utils/logger.dart';

class TasksRepository {
  final TasksLocalDatasource _localTasks;
  final RevisionLocalDatasource _localRevision;
  final TasksRemoteDatasource _remoteTasks;

  const TasksRepository(
    this._localTasks,
    this._localRevision,
    this._remoteTasks,
  );

  Future<void> createTask(TaskModel newTask) async {
    log.d('[$runtimeType] createTask(${prettyString(newTask)})');
    final revision = await _localRevision.getRevision();

    _localTasks.createTask(TaskHive.fromModel(newTask));

    await _remoteTasks.createTask(newTask, revision);
    await _incrementRevision(revision);
  }

  Future<void> deleteTask(String id) async {
    log.d('[$runtimeType] deleteTask($id)');
    final revision = await _localRevision.getRevision();

    _localTasks.deleteTask(id);
    await _remoteTasks.deleteTask(id, revision);
    await _incrementRevision(revision);
  }

  Future<List<TaskModel>> getTasks() async {
    log.d('[$runtimeType] getTasks()');

    final localTasks = _getLocalTasks();
    final remoteTasksResponse = await _remoteTasks.getTasks();
    final remoteTasks = remoteTasksResponse.tasks
        .map((e) => TaskModel.fromResponse(e))
        .toList();

    log.d('[$runtimeType] Loaded remote tasks:');
    log.d(prettyString(remoteTasks));

    log.d('[$runtimeType] listEquals(${prettyString(localTasks)}');
    log.d('${prettyString(remoteTasks)}) ==');
    log.d('${listEquals(localTasks, remoteTasks)}');

    return remoteTasks;
  }

  Future<TaskModel> getTask(String id) async {
    log.d('[$runtimeType] getTask($id)');

    final remoteTaskResponse = await _remoteTasks.getTask(id);
    final remoteTask = TaskModel.fromResponse(remoteTaskResponse.task);

    log.d('[$runtimeType] Loaded remoteTaskResponse:');
    log.d(prettyString(remoteTaskResponse));

    return remoteTask;
  }

  Future<List<TaskModel>> updateList(List<TaskModel> tasks) async {
    log.d('[$runtimeType] updateList(${prettyString(tasks)})');
    final revision = await _localRevision.getRevision();

    _localTasks.updateList(tasks.map((e) => TaskHive.fromModel(e)).toList());

    final mergedTasksResponse = await _remoteTasks.updateList(tasks, revision);
    final mergedTasks = mergedTasksResponse.tasks
        .map((e) => TaskModel.fromResponse(e))
        .toList();

    log.d('[$runtimeType] Loaded mergedTasksResponse:');
    log.d(prettyString(mergedTasksResponse));

    _localTasks.updateList(
      mergedTasks.map((e) => TaskHive.fromModel(e)).toList(),
    );

    _localRevision.setRevision(mergedTasksResponse.revision);
    return mergedTasks;
  }

  Future<void> updateTask(TaskModel newTask) async {
    log.d('[$runtimeType] updateTask(${prettyString(newTask)})');
    final revision = await _localRevision.getRevision();

    _localTasks.updateTask(TaskHive.fromModel(newTask));
    await _remoteTasks.updateTask(newTask, revision);

    _incrementRevision(revision);
  }

  List<TaskModel> _getLocalTasks() {
    log.d('[$runtimeType] _getLocalTasks()');
    return _localTasks.getTasks().map((e) => TaskModel.fromHive(e)).toList();
  }

  Future<void> _incrementRevision(int revision) async {
    log.d('[$runtimeType] _incrementRevision($revision)');
    await _localRevision.setRevision(revision + 1);
  }
}
