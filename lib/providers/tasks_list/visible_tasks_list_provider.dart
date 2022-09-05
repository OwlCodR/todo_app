import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'completed_task_visibility_provider.dart';
import 'tasks_list_provider.dart';

final visibleTasksListProvider = Provider((ref) {
  final areCompletedTasksVisible = ref.watch(completedTaskVisibilityProvider);
  final tasksListController = ref.watch(tasksListControllerProvider);

  return tasksListController
      .where(
        (element) =>
            !element.isDone || element.isDone == areCompletedTasksVisible,
      )
      .toList();
});
