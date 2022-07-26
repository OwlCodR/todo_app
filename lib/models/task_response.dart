import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/models/task_model.dart';

part 'task_response.freezed.dart'; // Associates our class with the code generated by Freezed
part 'task_response.g.dart'; // Makes TaskResponse serializable

@freezed
class TaskResponse with _$TaskResponse {
  factory TaskResponse({
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'element') required TaskModel task,
    @JsonKey(name: 'revision') required int revision,
  }) = _TaskResponse;

  factory TaskResponse.fromJson(Map<String, Object?> json) =>
      _$TaskResponseFromJson(json);
}
