import '../models/task_model.dart';

abstract class BaseRepository {
  List<TaskModel> getList();
  TaskModel getTask(String id);
  void updateTask(TaskModel newTask);
  void updateList(List<TaskModel> tasks);
  void createTask(TaskModel newTask);
  void deleteTask(String id);
}
