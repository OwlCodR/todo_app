import '../datasources/revision_local_datasource.dart';
import '../datasources/tasks_local_datasource.dart';
import '../datasources/tasks_remote_datasource.dart';
import '../models/data/local/task_hive.dart';
import '../models/domain/task_model.dart';
import '../utils/json_pretty_print.dart';
import '../utils/logger.dart';
import '../utils/status_enum.dart';

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

    _localTasks.addTask(TaskHive.fromModel(newTask));
    await _incrementRevision(revision);

    await _remoteTasks.createTask(newTask, revision);
  }

  Future<void> deleteTask(String id) async {
    log.d('[$runtimeType] deleteTask($id)');
    final revision = await _localRevision.getRevision();

    _localTasks.deleteTask(id);
    await _incrementRevision(revision);

    await _remoteTasks.deleteTask(id, revision);
  }

  List<TaskModel> getLocalTasks() {
    log.d('[$runtimeType] getLocalTasks()');
    return _localTasks.getTasks().map(TaskModel.fromHive).toList();
  }

  // Returns tasks from remote or local depends on revision
  // If remote is newer - updates local
  Future<List<TaskModel>> getActualTasks({
    required List<TaskModel> localTasks,
  }) async {
    log.d('[$runtimeType] getActualTasks()');

    final response = await _remoteTasks.getTasks();
    if (response.status != Status.ok.string) {
      log.w('[$runtimeType] Status != ok');
      return localTasks;
    }

    final remoteRevision = response.revision;
    final remoteTasks = response.tasks.map(TaskModel.fromResponse).toList();
    final localRevision = await _localRevision.getRevision();

    if (localRevision > remoteRevision) {
      mergeTasks(); // Do not await here
      return localTasks;
    } else {
      _updateLocalTasks(remoteTasks, remoteRevision); // Do not await
      return remoteTasks;
    }
  }

  Future<TaskModel> getTask(String id) async {
    log.d('[$runtimeType] getTask($id)');

    final localTask = TaskModel.fromHive(_localTasks.getTask(id));
    final remoteTaskResponse = await _remoteTasks.getTask(id);

    log.d('[$runtimeType] Loaded remoteTaskResponse:');
    log.d(prettyString(remoteTaskResponse));

    if (remoteTaskResponse.status != Status.ok.string) {
      log.w('[$runtimeType] Status != ok');
      return localTask;
    }

    final localRevision = await _localRevision.getRevision();
    final remoteRevision = remoteTaskResponse.revision;
    final remoteTask = TaskModel.fromResponse(remoteTaskResponse.task);

    if (localRevision > remoteRevision) {
      log.d(
          '[$runtimeType] localRevision=$localRevision > remoteRevision=$remoteRevision');
      return localTask;
    }

    _updateLocalTask(remoteTask, remoteRevision);
    return remoteTask;
  }

  // Updates ans saves local tasks by merging them with remote storage
  Future<List<TaskModel>> mergeTasks() async {
    log.d('[$runtimeType] mergeTasks()');
    final revision = await _localRevision.getRevision();

    final localTasks = _localTasks.getTasks().map(TaskModel.fromHive).toList();

    final mergedTasksResponse =
        await _remoteTasks.getMergedTasks(localTasks, revision);

    if (mergedTasksResponse.status != Status.ok.string) {
      log.w('[$runtimeType] Status != ok');
      return localTasks;
    }

    final mergedTasks =
        mergedTasksResponse.tasks.map(TaskModel.fromResponse).toList();

    log.d('[$runtimeType] Loaded mergedTasksResponse:');
    log.d(prettyString(mergedTasksResponse));

    _updateLocalTasks(mergedTasks, mergedTasksResponse.revision);
    return mergedTasks;
  }

  Future<void> setTask(TaskModel newTask) async {
    log.d('[$runtimeType] updateTask(${prettyString(newTask)})');
    final revision = await _localRevision.getRevision();

    _updateLocalTask(newTask, revision + 1);

    await _remoteTasks.setTask(newTask, revision);
  }

  void _updateLocalTasks(List<TaskModel> tasks, int revision) {
    log.d(
        '[$runtimeType] _updateLocalTasks(tasks: $tasks, revision: $revision)');
    _localTasks.setTasks(tasks.map(TaskHive.fromModel).toList());
    _localRevision.setRevision(revision);
  }

  void _updateLocalTask(TaskModel task, int revision) {
    log.d('[$runtimeType] _updateLocalTask(task: $task, revision: $revision)');
    _localTasks.setTask(TaskHive.fromModel(task));
    _localRevision.setRevision(revision);
  }

  Future<void> _incrementRevision(int revision) {
    log.d('[$runtimeType] _incrementRevision($revision)');
    return _localRevision.setRevision(revision + 1);
  }
}
