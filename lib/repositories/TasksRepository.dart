import 'package:todo_app/models/task_response.dart';
import 'package:todo_app/models/tasks_response.dart';
import 'package:todo_app/repositories/BaseRepository.dart';

class ApiRepository implements BaseRepository {
  @override
  void createElement(TaskResponse newElement) {
    // TODO: implement createElement
  }

  @override
  void deleteElement(String id) {
    // TODO: implement deleteElement
  }

  @override
  TaskResponse getElement(String id) {
    // TODO: implement getElement
    throw UnimplementedError();
  }

  @override
  TasksResponse getList() {
    // TODO: implement getList
    throw UnimplementedError();
  }

  @override
  TaskResponse updateElement(TaskResponse newElement) {
    // TODO: implement updateElement
    throw UnimplementedError();
  }

  @override
  TasksResponse updateList(TasksResponse tasks) {
    // TODO: implement updateList
    throw UnimplementedError();
  }
}
