import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/task_model.dart';
import 'completed_task_visibility_provider.dart';
import 'tasks_list_provider.dart';

final visibleTasksListProvider = StateProvider<List<TaskModel>>((ref) {
  final areCompletedTasksVisible = ref.watch(completedTaskVisibilityProvider);

  return ref
      .watch(tasksListProvider.notifier)
      .getList()
      .where((element) =>
          !element.isDone || element.isDone == areCompletedTasksVisible)
      .toList();
});
