import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:todo_app/constants/api_paths.dart';
import 'package:todo_app/models/domain/task_model.dart';

import '../interceptors/token_interceptor.dart';
import '../models/data/remote/task_response.dart';
import '../models/data/remote/tasks_response.dart';
import '../models/task_request.dart';
import '../models/tasks_request.dart';
import '../utils/json_pretty_print.dart';
import '../utils/logger.dart';

class TasksRemoteDatasource {
  static final _dio = Dio(BaseOptions(baseUrl: ApiPaths.baseUrl));
  static const lastKnownRevisionHeader = 'X-Last-Known-Revision';

  static final _token = dotenv.get('TOKEN');

  TasksRemoteDatasource() {
    _dio.interceptors
      ..add(TokenInterceptors(_token))
      ..add(DioLoggingInterceptor(level: Level.body));
  }

  Future<void> createTask(TaskModel newTask, int lastKnownRevision) {
    log.d('[$runtimeType] createTask(${prettyString(newTask)})');
    return _dio.post(
      ApiPaths.list,
      data: jsonEncode(TaskRequest(task: newTask).toJson()),
      options: Options(
        headers: {
          lastKnownRevisionHeader: lastKnownRevision,
        },
      ),
    );
  }

  Future<void> deleteTask(String id, int lastKnownRevision) {
    log.d('[$runtimeType] deleteTask($id)');
    return _dio.delete(
      '${ApiPaths.list}/$id',
      options: Options(
        headers: {
          lastKnownRevisionHeader: lastKnownRevision,
        },
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
  ) {
    log.d('[$runtimeType] updateTask(${prettyString(newTask)})');
    return _dio.put(
      '${ApiPaths.list}/${newTask.id}',
      data: jsonEncode(TaskRequest(task: newTask).toJson()),
      options: Options(
        headers: {
          lastKnownRevisionHeader: lastKnownRevision,
        },
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
      data: jsonEncode(TasksRequest(tasks: tasks).toJson()),
      options: Options(
        headers: {
          lastKnownRevisionHeader: lastKnownRevision,
        },
      ),
    );
    return TasksResponse.fromJson(response.data);
  }
}
