import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/domain/task_model.dart';
import 'package:todo_app/providers/device_id_provider.dart';
import 'package:todo_app/providers/tasks_editor/editor_date_time_provider.dart';
import 'package:todo_app/providers/tasks_editor/editor_importance_provider.dart';
import 'package:todo_app/providers/tasks_editor/editor_switch_state_provider.dart';
import 'package:uuid/uuid.dart';

import 'editor_title_provider.dart';

final editorTaskInfoProvider =
    Provider.autoDispose.family<TaskModel, TaskModel?>(
  (ref, editingModel) => TaskModel(
    id: editingModel?.id ?? const Uuid().v4(),
    isDone: editingModel?.isDone ?? false,
    title: ref.watch(editorTitleProvider),
    importance: ref.watch(importanceProvider),
    deadlineTime: ref.watch(switchStateProvider)
        ? ref.watch(dateTimeProvider).millisecondsSinceEpoch
        : null,
    createdAt: editingModel?.createdAt ?? DateTime.now().millisecondsSinceEpoch,
    changedAt: DateTime.now().millisecondsSinceEpoch,
    lastUpdatedBy: ref.watch(deviceIdProvider),
  ),
);
