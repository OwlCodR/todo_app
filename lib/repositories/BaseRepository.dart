import 'package:todo_app/models/task_response.dart';
import 'package:todo_app/models/tasks_response.dart';

abstract class BaseRepository {
  TasksResponse getList();
  TasksResponse updateList(TasksResponse tasks);
  TaskResponse getElement(String id);
  TaskResponse updateElement(TaskResponse newElement);
  void createElement(TaskResponse newElement);
  void deleteElement(String id);
}
