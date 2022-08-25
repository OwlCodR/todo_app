import 'package:freezed_annotation/freezed_annotation.dart';

import 'domain/task_model.dart';

part 'task_request.freezed.dart'; // Associates our class with the code generated by Freezed
part 'task_request.g.dart'; // Makes TaskRequest serializable

@freezed
class TaskRequest with _$TaskRequest {
  factory TaskRequest({
    @JsonKey(name: 'element') required TaskModel task,
  }) = _TaskRequest;

  factory TaskRequest.fromJson(Map<String, Object?> json) =>
      _$TaskRequestFromJson(json);
}
