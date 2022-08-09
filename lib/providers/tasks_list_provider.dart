import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/tasks_list_controller.dart';
import '../models/task_model.dart';
import 'repository_provider.dart';

final tasksListProvider =
    StateNotifierProvider<TasksListController, List<TaskModel>>(
  (ref) {
    final repository = ref.read(repositoryProvider);
    return TasksListController(tasks: repository.getList(ref), ref: ref);
  },
);
