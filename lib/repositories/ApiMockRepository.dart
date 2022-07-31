import 'package:todo_app/models/task.dart';
import 'package:todo_app/models/tasks.dart';

import 'BaseRepository.dart';

class ApiMockRepository implements BaseRepository {
  @override
  void createElement(Task newElement) {
    // TODO: implement createElement
  }

  @override
  void deleteElement(String id) {
    // TODO: implement deleteElement
  }

  @override
  Task getElement(String id) {
    // TODO: implement getElement
    throw UnimplementedError();
  }

  @override
  Tasks getList() {
    // TODO: implement getList
    throw UnimplementedError();
  }

  @override
  Task updateElement(Task newElement) {
    // TODO: implement updateElement
    throw UnimplementedError();
  }

  @override
  Tasks updateList(Tasks tasks) {
    // TODO: implement updateList
    throw UnimplementedError();
  }
}
