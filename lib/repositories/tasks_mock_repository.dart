import 'package:todo_app/models/task_model.dart';

import 'base_repository.dart';

class ApiMockRepository implements BaseRepository {
  @override
  void createTask(TaskModel newTask) {
    // TODO: implement createTask
  }

  @override
  void deleteTask(String id) {
    // TODO: implement deleteTask
  }

  @override
  List<TaskModel> getList() {
    // TODO: implement getList
    throw UnimplementedError();
  }

  @override
  TaskModel getTask(String id) {
    // TODO: implement getTask
    throw UnimplementedError();
  }

  @override
  void updateList(List<TaskModel> tasks) {
    // TODO: implement updateList
  }

  @override
  void updateTask(TaskModel newTask) {
    // TODO: implement updateTask
  }
}
