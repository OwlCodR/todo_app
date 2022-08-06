import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/models/task_response.dart';

import '../interceptors/token_interceptor.dart';
import '../models/tasks_response.dart';
import '../utils/logger.dart';

class TasksRemoteDatasource {
  static final _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  static TasksRemoteDatasource? _instance;

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

  Future<void> createTask(TaskModel newTask) async {
    try {
      await _dio.post('$_baseUrl/list', data: newTask.toJson());
    } on DioError catch (e) {
      _handleResponseError(e);
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      await _dio.delete('$_baseUrl/list/$id');
    } on DioError catch (e) {
      _handleResponseError(e, id);
    }
  }

  Future<TaskResponse?> getTask(String id) async {
    try {
      final response = await _dio.get<TaskResponse>('$_baseUrl/list/$id');
      return response.data;
    } on DioError catch (e) {
      _handleResponseError(e, id);
    }
    return null;
  }

  Future<TasksResponse?> getList() async {
    try {
      final response = await _dio.get<TasksResponse>('$_baseUrl/list');
      return response.data;
    } on DioError catch (e) {
      _handleResponseError(e);
    }
    return null;
  }

  Future<void> updateTask(TaskModel newTask) async {
    try {
      await _dio.put('$_baseUrl/list/${newTask.id}');
    } on DioError catch (e) {
      _handleResponseError(e);
    }
  }

  Future<void> updateList(TaskModel tasks) async {
    try {
      await _dio.patch('$_baseUrl/list', data: tasks.toJson());
    } on DioError catch (e) {
      _handleResponseError(e);
    }
  }

  void _handleResponseError(
    DioError e, [
    String id = '',
    Function() syncData = _doNothing,
  ]) {
    final response = e.response;

    if (response == null) {
      log.e(
        '[Dio] Something happend with settings: '
        '${e.requestOptions}, ${e.message}',
      );
      return;
    }

    switch (response.statusCode) {
      case 500:
        log.e('[Dio] Server error.');
        break;
      case 404:
        log.e('[Dio] Wrong id: $id.');
        break;
      case 401:
        log.e('[Dio] Wrong token.');
        break;
      case 400:
        if (response.data == null) {
          log.e('[Dio] Wrong body.');
        } else if (response.data as String == 'unsynchronized data') {
          log.e('[Dio] Unsynchronized data.');
          // TODO Sync data
          syncData();
        }
        break;
      default:
        log.e('[Dio] Status code: ${response.statusCode}');
    }
  }

  static void _doNothing() {}
}
