import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/models/task_response.dart';

import '../interceptors/token_interceptor.dart';
import '../models/tasks_response.dart';
import '../utils/json_pretty_print.dart';
import '../utils/logger.dart';

class TasksRemoteDatasource {
  static final _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  static TasksRemoteDatasource? _instance;
  static const String lastKnownRevisionHeader = 'X-Last-Known-Revision';

  static const _baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://beta.mrdekk.ru/todobackend',
  );

  static const _token = String.fromEnvironment(
    'TOKEN',
    defaultValue: 'Zapus',
  );

  TasksRemoteDatasource._constructor() {
    _dio.interceptors
      ..add(TokenInterceptors(_token))
      ..add(DioLoggingInterceptor(level: Level.body));
  }

  static TasksRemoteDatasource getInstance() {
    // Making it Singleton
    _instance ??= TasksRemoteDatasource._constructor();
    return _instance!;
  }

  Future<void> createTask(TaskModel newTask, int lastKnownRevision) async {
    log.d('[TasksRemoteDatasource] createTask(${prettyString(newTask)})');
    try {
      await _dio.post(
        '$_baseUrl/list',
        data: jsonEncode({'element': newTask.toJson()}),
        options: Options(
          headers: {lastKnownRevisionHeader: lastKnownRevision},
        ),
      );
    } on DioError catch (e) {
      _handleResponseError(e);
    }
  }

  Future<void> deleteTask(String id) async {
    log.d('[TasksRemoteDatasource] deleteTask($id)');
    try {
      await _dio.delete('$_baseUrl/list/$id');
    } on DioError catch (e) {
      _handleResponseError(e, id);
    }
  }

  Future<TaskResponse?> getTask(String id) async {
    log.d('[TasksRemoteDatasource] getTask($id)');
    try {
      final response = await _dio.get('$_baseUrl/list/$id');
      log.d(
          '[TasksRemoteDatasource] Loaded response: ${prettyString(response.data)}');
      return TaskResponse.fromJson(response.data);
    } on DioError catch (e) {
      _handleResponseError(e, id);
    }
    return null;
  }

  Future<TasksResponse?> getTasks() async {
    log.d('[TasksRemoteDatasource] getTasks()');
    try {
      final response = await _dio.get('$_baseUrl/list');
      log.d(
          '[TasksRemoteDatasource] Loaded response: ${prettyString(response.data)}');
      return TasksResponse.fromJson(response.data);
    } on DioError catch (e) {
      return _handleResponseError(e);
    }
  }

  Future<void> updateTask(
    TaskModel newTask,
    int lastKnownRevision,
  ) async {
    log.d('[TasksRemoteDatasource] updateTask(${prettyString(newTask)})');
    try {
      await _dio.put(
        '$_baseUrl/list/${newTask.id}',
        data: jsonEncode({'element': newTask.toJson()}),
        options: Options(headers: {lastKnownRevisionHeader: lastKnownRevision}),
      );
    } on DioError catch (e) {
      _handleResponseError(e);
      await Future.delayed(const Duration(seconds: 5));
    }
  }

  Future<TasksResponse?> updateList(
    List<TaskModel> tasks,
    int lastKnownRevision,
  ) async {
    log.d('[TasksRemoteDatasource] updateList(${prettyString(tasks)})');
    try {
      final response = await _dio.patch('$_baseUrl/list',
          data: jsonEncode({'list': tasks}),
          options: Options(
            headers: {lastKnownRevisionHeader: lastKnownRevision},
          ));
      log.d('[TasksRemoteDatasource] Loaded response: ${response.data}');
      return TasksResponse.fromJson(response.data);
    } on DioError catch (e) {
      return _handleResponseError(e);
    }
  }

  dynamic _handleResponseError(
    DioError e, [
    String id = '',
  ]) {
    final response = e.response;

    if (response == null) {
      log.e(
        '[TasksRemoteDatasource] Something happend with settings: '
        '${e.requestOptions.data}, ${e.message}',
      );
      return null;
    }

    switch (response.statusCode) {
      case 500:
        log.e('[TasksRemoteDatasource] Server error.');
        break;
      case 404:
        log.e('[TasksRemoteDatasource] Wrong id: $id.');
        break;
      case 401:
        log.e('[TasksRemoteDatasource] Wrong token.');
        break;
      case 400:
        if (response.data == null) {
          log.e('[TasksRemoteDatasource] Wrong body.');
        } else if (response.data as String == 'unsynchronized data') {
          log.w('[TasksRemoteDatasource] Unsynchronized data.');
          return getTasks();
        }
        break;
      default:
        log.e('[TasksRemoteDatasource] Status code: ${response.statusCode}');
    }
  }
}
