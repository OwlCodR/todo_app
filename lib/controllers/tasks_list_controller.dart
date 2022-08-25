import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:uuid/uuid.dart';

import '../models/task_model.dart';
import '../repositories/tasks_repository.dart';
import '../utils/logger.dart';

class TasksListController extends StateNotifier<List<TaskModel>> {
  TasksListController({
    required this.repository,
  }) : super([]) {
    loadList();
  }

  TasksRepository repository;

  void loadList() {
    log.d('[$runtimeType] loadList()');
    repository.getTasks().then((list) => state = list).catchError(
      (error) {
        _handleRemoteError(error: error);
      },
    );
  }

  void addDefaultTask(String title) {
    PlatformDeviceId.getDeviceId.then((deviceId) {
      final defaultTask = TaskModel(
        id: const Uuid().v4(),
        isDone: false,
        title: title,
        priority: TaskModel.basicPriority,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        changedAt: DateTime.now().millisecondsSinceEpoch,
        lastUpdatedBy: deviceId ?? const Uuid().v4(),
      );

      addTask(defaultTask);
    });
  }

  void addTask(TaskModel task) {
    log.d('[$runtimeType] addTask($task)');

    repository.createTask(task).catchError(
      (error) {
        _handleRemoteError(
          error: error,
          onUnsynchronized: _synchronizeTasks,
        );
      },
    );

    state = [...state, task];
  }

  void removeTask(String id) {
    log.d('[$runtimeType] removeTask($id)');

    repository.deleteTask(id).catchError(
      (error) {
        _handleRemoteError(
          error: error,
          onUnsynchronized: _synchronizeTasks,
        );
      },
    );

    state = [
      for (final task in state)
        if (task.id != id) task,
    ];
  }

  void updateTask(TaskModel newTask) {
    log.d('[$runtimeType] updateTask($newTask)');

    repository.updateTask(newTask).catchError(
      (error) {
        _handleRemoteError(
          error: error,
          onUnsynchronized: _synchronizeTasks,
        );
      },
    );

    state = [
      for (final task in state)
        if (task.id == newTask.id)
          task.copyWith(
            isDone: newTask.isDone,
            title: newTask.title,
            priority: newTask.priority,
            createdAt: newTask.createdAt,
            changedAt: newTask.changedAt,
            lastUpdatedBy: newTask.lastUpdatedBy,
            deadlineTime: newTask.deadlineTime,
            color: newTask.color,
          )
        else
          task
    ];
  }

  Future<void> _synchronizeTasks() async {
    log.d('[$runtimeType] _synchronizeLocalTasks()');
    await repository.updateList(state);
  }

  static void _doNothing() {
    log.w('[TasksListController] Unhandled exception');
  }

  void _handleRemoteError({
    required DioError error,
    Function onSettingsError = _doNothing,
    Function onServerError = _doNothing,
    Function onWrongId = _doNothing,
    Function onWrongToken = _doNothing,
    Function onWrongBody = _doNothing,
    Function onUnsynchronized = _doNothing,
  }) {
    final response = error.response;

    if (response == null) {
      log.e('[$runtimeType] Something happend with settings:');
      log.e('Options: ${error.requestOptions.data}');
      log.e('Error: ${error.message}');

      onSettingsError();
      return;
    }

    switch (response.statusCode) {
      case 500:
        log.e('[$runtimeType] Server error.');
        onServerError();
        break;
      case 404:
        log.e('[$runtimeType] Wrong id.');
        onWrongId();
        break;
      case 401:
        log.e('[$runtimeType] Wrong token.');
        onWrongToken();
        break;
      case 400:
        if (response.data == null) {
          log.e('[$runtimeType] Wrong body.');
          onWrongBody();
        } else if (response.data as String == 'unsynchronized data') {
          log.w('[$runtimeType] Unsynchronized data.');
          onUnsynchronized();
        }
        break;
      default:
        log.e('[$runtimeType] Status code: ${response.statusCode}');
    }
  }
}
