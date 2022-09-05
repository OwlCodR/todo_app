import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/domain/task_model.dart';
import 'package:todo_app/providers/navigation/navigation_controller_provider.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../../controllers/tasks_list_controller.dart';
import 'repository_provider.dart';

final tasksListControllerProvider =
    StateNotifierProvider<TasksListController, List<TaskModel>>(
  (ref) {
    final repository = ref.watch(repositoryProvider);
    final navigationController = ref.watch(navigationControllerProvider);
    final appLocalizations = AppLocalizations.of(
      navigationController.scaffoldMessengerState.context,
    );

    final controller = TasksListController(
      repository: repository,
      appLocalizations: appLocalizations,
      navigationController: navigationController,
    );

    return controller;
  },
);
