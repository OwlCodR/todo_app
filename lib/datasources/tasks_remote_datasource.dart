import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:todo_app/constants/api_paths.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/models/task_response.dart';
import 'package:todo_app/models/tasks_response.dart';

import '../interceptors/token_interceptor.dart';
import '../utils/json_pretty_print.dart';
import '../utils/logger.dart';

class TasksRemoteDatasource {
  static final _dio = Dio(BaseOptions(baseUrl: ApiPaths.baseUrl));
  static const lastKnownRevisionHeader = 'X-Last-Known-Revision';

  static const _token = String.fromEnvironment(
    'TOKEN',
    defaultValue: 'Zapus',
  );

  TasksRemoteDatasource() {
    _dio.interceptors
      ..add(TokenInterceptors(_token))
      ..add(DioLoggingInterceptor(level: Level.body));
  }

  Future<void> createTask(TaskModel newTask, int lastKnownRevision) async {
    log.d('[$runtimeType] createTask(${prettyString(newTask)})');
    await _dio.post(
      ApiPaths.list,
      data: jsonEncode({'element': newTask.toJson()}),
      options: Options(
        headers: {lastKnownRevisionHeader: lastKnownRevision},
      ),
    );
  }

  Future<void> deleteTask(String id, int lastKnownRevision) async {
    log.d('[$runtimeType] deleteTask($id)');
    await _dio.delete(
      '${ApiPaths.list}/$id',
      options: Options(
        headers: {lastKnownRevisionHeader: lastKnownRevision},
      ),
    );
  }

  Future<TaskResponse> getTask(String id) async {
    log.d('[$runtimeType] getTask($id)');
    final response = await _dio.get('${ApiPaths.list}/$id');
    return TaskResponse.fromJson(response.data);
  }

  Future<TasksResponse> getTasks() async {
    log.d('[$runtimeType] getTasks()');
    final response = await _dio.get(ApiPaths.list);
    return TasksResponse.fromJson(response.data);
  }

  Future<void> updateTask(
    TaskModel newTask,
    int lastKnownRevision,
  ) async {
    log.d('[$runtimeType] updateTask(${prettyString(newTask)})');
    await _dio.put(
      '${ApiPaths.list}/${newTask.id}',
      data: jsonEncode({'element': newTask.toJson()}),
      options: Options(
        headers: {lastKnownRevisionHeader: lastKnownRevision},
      ),
    );
  }

  Future<TasksResponse> updateList(
    List<TaskModel> tasks,
    int lastKnownRevision,
  ) async {
    log.d('[$runtimeType] updateList(${prettyString(tasks)})');
    final response = await _dio.patch(
      ApiPaths.list,
      data: jsonEncode({'list': tasks}),
      options: Options(
        headers: {lastKnownRevisionHeader: lastKnownRevision},
      ),
    );
    return TasksResponse.fromJson(response.data);
  }
}
