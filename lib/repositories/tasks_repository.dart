import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/datasources/revision_local_datasource.dart';
import 'package:todo_app/datasources/tasks_local_datasource.dart';
import 'package:todo_app/models/task_model.dart';

import '../datasources/tasks_remote_datasource.dart';
import '../models/task_hive.dart';
import '../utils/json_pretty_print.dart';
import '../utils/logger.dart';

class TaskRepository {
  final TasksLocalDatasource _localTasks;
  final RevisionLocalDatasource _localRevision;
  final TasksRemoteDatasource _remoteTasks;

  const TaskRepository(
    this._localTasks,
    this._localRevision,
    this._remoteTasks,
  );

  void createTask(TaskModel newTask) {
    log.d('[TaskRepository] createTask(${prettyString(newTask)})');
    _localTasks.createTask(TaskHive.fromModel(newTask));

    _localRevision.getRevision().then((revision) async {
      await _localRevision.setRevision(revision + 1);
      await _remoteTasks.createTask(newTask, revision);
    });
  }

  void deleteTask(String id) {
    log.d('[TaskRepository] deleteTask($id)');
    _localTasks.deleteTask(id);

    _localRevision.getRevision().then((revision) async {
      await _localRevision.setRevision(revision + 1);
      await _remoteTasks.deleteTask(id, revision);
    });
  }

  List<TaskModel> getList(Ref ref) {
    log.d('[TaskRepository] getList()');

    final localTasks =
        _localTasks.getList().map((e) => TaskModel.fromHive(e)).toList();

    final tasksProvider = StateProvider<List<TaskModel>>((ref) => localTasks);

    _remoteTasks.getTasks().then((remoteTasks) {
      log.d('[TaskRepository] Loaded remoteTasks: '
          '${prettyString(remoteTasks)}');

      if (remoteTasks == null) return;

      log.d('[TaskRepository] listEquals(${prettyString(localTasks)}, '
          '${prettyString(remoteTasks.tasks)}) == '
          '${listEquals(localTasks, remoteTasks.tasks)}');

      if (!listEquals(localTasks, remoteTasks.tasks)) {
        ref
            .read(tasksProvider.notifier)
            .update((state) => updateList(remoteTasks.tasks, ref));
      }
    });

    return ref.watch(tasksProvider);
  }

  TaskModel getTask(String id, Ref ref) {
    log.d('[TaskRepository] getTask($id)');
    final localTask = TaskModel.fromHive(_localTasks.getTask(id));
    final tasksProvider = StateProvider<TaskModel>((ref) => localTask);

    _remoteTasks.getTask(id).then((remoteTask) {
      log.d('[TaskRepository] Loaded remoteTask: ${prettyString(remoteTask)}');
      if (remoteTask == null) return;

      if (remoteTask.task != localTask) {
        updateTask(remoteTask.task);
        ref.read(tasksProvider.notifier).update((state) => remoteTask.task);
      }
    });

    return ref.watch(tasksProvider);
  }

  List<TaskModel> updateList(List<TaskModel> tasks, Ref ref) {
    log.d('[TaskRepository] updateList(${prettyString(tasks)})');
    _localTasks.updateList(tasks.map((e) => TaskHive.fromModel(e)).toList());

    final tasksProvider = StateProvider<List<TaskModel>>((ref) => tasks);

    _localRevision.getRevision().then((revision) {
      _remoteTasks.updateList(tasks, revision).then((remoteTasks) {
        log.d(
            '[TaskRepository] Loaded remoteTasks: ${prettyString(remoteTasks)}');
        if (remoteTasks == null) return;

        _localTasks.updateList(
          remoteTasks.tasks.map((e) => TaskHive.fromModel(e)).toList(),
        );
        ref.read(tasksProvider.notifier).update((state) => remoteTasks.tasks);
        _localRevision.setRevision(remoteTasks.revision);
      });
    });

    return ref.watch(tasksProvider);
  }

  void updateTask(TaskModel newTask) {
    log.d('[TaskRepository] updateTask(${prettyString(newTask)})');

    _localTasks.updateTask(TaskHive.fromModel(newTask));

    _localRevision.getRevision().then((revision) {
      _remoteTasks.updateTask(newTask, revision);
    });
  }
}
