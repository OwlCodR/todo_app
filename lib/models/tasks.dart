import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/models/task_element.dart';

part 'tasks.freezed.dart'; // Associates our `main.dart` with the code generated by Freezed
part 'tasks.g.dart'; // Makes TaskResponse serializable

@freezed
class Tasks with _$Tasks {
  factory Tasks({
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'list') required List<TaskElement> tasks,
    @JsonKey(name: 'revision') required int revision,
  }) = _Tasks;

  factory Tasks.fromJson(Map<String, Object?> json) => _$TasksFromJson(json);
}
