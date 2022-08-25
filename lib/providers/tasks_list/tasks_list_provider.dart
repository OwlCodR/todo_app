import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/domain/task_model.dart';
import 'package:todo_app/providers/device_id_provider.dart';

import '../../controllers/tasks_list_controller.dart';
import 'repository_provider.dart';

final tasksListControllerProvider =
    StateNotifierProvider<TasksListController, List<TaskModel>>((ref) {
  final repository = ref.watch(repositoryProvider);
  final deviceId = ref.watch(deviceIdProvider);

  final controller = TasksListController(
    repository: repository,
    deviceId: deviceId,
  );

  return controller;
});
