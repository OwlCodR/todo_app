import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/utils/importance_enum.dart';
import 'package:todo_app/utils/status_enum.dart';
import 'package:uuid/uuid.dart';

import '../constants/app_metrics.dart';
import '../models/domain/task_model.dart';
import '../repositories/tasks_repository.dart';
import '../utils/logger.dart';

class TasksListController extends StateNotifier<List<TaskModel>> {
  TasksListController({
    required this.repository,
    required this.deviceId,
  }) : super([]) {
    loadList();
  }

  TasksRepository repository;
  String? deviceId;

  void loadList() async {
    log.d('[$runtimeType] loadList()');

    try {
      state = repository.getLocalTasks();
      state = await repository.getActualTasks(localTasks: state);
    } on DioError catch (e) {
      _handleDioError(
        error: e,
        onConnectionError: () {
          // TODO Show message
        },
      );
    } catch (e) {
      _doNothing(error: e.toString());
    }
  }

  void addDefaultTask(String title) {
    addTask(
      TaskModel(
        id: const Uuid().v4(),
        isDone: false,
        title: title,
        importance: Importance.basic,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        changedAt: DateTime.now().millisecondsSinceEpoch,
        lastUpdatedBy: deviceId ?? const Uuid().v4(),
      ),
    );
  }

  Future<void> addTask(TaskModel task) async {
    log.d('[$runtimeType] addTask($task)');

    try {
      await repository.createTask(task);
    } on DioError catch (e) {
      _handleDioError(
        error: e,
        onUnsynchronized: _synchronizeTasks,
        onConnectionError: () {
          // TODO Show message
        },
      );
    } catch (e) {
      _doNothing(error: e.toString());
    }

    state = [...state, task];
    FirebaseAnalytics.instance.logEvent(
      name: AppMetrics.taskAdded,
      parameters: {
        'task_id': task.id,
      },
    );
  }

  Future<void> removeTask(String id) async {
    log.d('[$runtimeType] removeTask($id)');

    try {
      await repository.deleteTask(id);
    } on DioError catch (e) {
      _handleDioError(
        error: e,
        onUnsynchronized: _synchronizeTasks,
        onConnectionError: () {
          // TODO Show message
        },
      );
    } catch (e) {
      _doNothing(error: e.toString());
    }

    state = [
      for (final task in state)
        if (task.id != id) task,
    ];

    FirebaseAnalytics.instance.logEvent(
      name: AppMetrics.taskRemoved,
      parameters: {
        'task_id': id,
      },
    );
  }

  Future<void> updateTask(TaskModel newTask) async {
    log.d('[$runtimeType] updateTask($newTask)');

    try {
      await repository.setTask(newTask);
    } on DioError catch (e) {
      _handleDioError(
        error: e,
        onUnsynchronized: _synchronizeTasks,
        onConnectionError: () {
          // TODO Show message
        },
      );
    } catch (e) {
      _doNothing(error: e.toString());
    }

    for (var task in state) {
      if (task.id == newTask.id && !task.isDone && newTask.isDone) {
        FirebaseAnalytics.instance.logEvent(
          name: AppMetrics.taskCompleted,
          parameters: {
            'task_id': task.id,
          },
        );
      }
    }

    state = [
      for (final task in state)
        if (task.id == newTask.id)
          task.copyWith(
            isDone: newTask.isDone,
            title: newTask.title,
            importance: newTask.importance,
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
    try {
      await repository.mergeTasks();
    } on DioError catch (e) {
      _handleDioError(
        error: e,
        onConnectionError: () {
          // TODO Show message
        },
      );
    } catch (e) {
      _doNothing(error: e.toString());
    }
  }

  static void _doNothing({String? error}) {
    log.w('[TasksListController] Unhandled exception: $error');
  }

  void _handleDioError({
    required DioError error,
    Function onConnectionError = _doNothing,
    Function onServerError = _doNothing,
    Function onWrongId = _doNothing,
    Function onWrongToken = _doNothing,
    Function onWrongBody = _doNothing,
    Function onUnsynchronized = _doNothing,
  }) {
    final response = error.response;

    if (response == null) {
      log.e('[$runtimeType] Connection error.');
      onConnectionError();
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
        } else if (response.data.toString() == Status.unsynchronized.string) {
          log.w('[$runtimeType] Unsynchronized data.');
          onUnsynchronized();
        }
        break;
      default:
        log.e('[$runtimeType] Status code: ${response.statusCode}');
    }
  }
}
