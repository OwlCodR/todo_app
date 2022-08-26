import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/domain/task_model.dart';
import 'package:todo_app/providers/device_id_provider.dart';
import 'package:todo_app/providers/tasks_editor/editor_date_time_provider.dart';
import 'package:todo_app/providers/tasks_editor/editor_importance_provider.dart';
import 'package:uuid/uuid.dart';

import 'editor_title_provider.dart';

final editorTaskInfoProvider =
    Provider.autoDispose.family<TaskModel, TaskModel?>((ref, editingModel) {
  final now = DateTime.now().millisecondsSinceEpoch;

  return TaskModel(
    id: editingModel?.id ?? const Uuid().v4(),
    isDone: editingModel?.isDone ?? false,
    title: ref.watch(editorTitleProvider(editingModel?.title)) ?? '',
    importance: ref.watch(importanceProvider(editingModel?.importance)),
    deadlineTime: ref
        .watch(dateTimeProvider(editingModel?.deadlineTime))
        .millisecondsSinceEpoch,
    createdAt: editingModel?.createdAt ?? now,
    changedAt: now,
    lastUpdatedBy: ref.watch(deviceIdProvider),
  );
});
