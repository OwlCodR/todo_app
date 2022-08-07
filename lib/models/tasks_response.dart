import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/models/task_model.dart';

part 'tasks_response.freezed.dart'; // Associates our class with the code generated by Freezed
part 'tasks_response.g.dart'; // Makes class serializable

@freezed
class TasksResponse with _$TasksResponse {
  factory TasksResponse({
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'list') required List<TaskModel> tasks,
    @JsonKey(name: 'revision') required int revision,
  }) = _TasksResponse;

  factory TasksResponse.fromJson(Map<String, Object?> json) =>
      _$TasksResponseFromJson(json);
}