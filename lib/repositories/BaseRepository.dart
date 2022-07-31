import 'package:todo_app/models/task.dart';
import 'package:todo_app/models/tasks.dart';

abstract class BaseRepository {
  Tasks getList();
  Tasks updateList(Tasks tasks);
  Task getElement(String id);
  Task updateElement(Task newElement);
  void createElement(Task newElement);
  void deleteElement(String id);
}
