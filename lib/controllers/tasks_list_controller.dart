import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/task_model.dart';
import '../providers/repository_provider.dart';
import '../utils/logger.dart';

class TasksListController extends StateNotifier<List<TaskModel>> {
  TasksListController({
    required List<TaskModel> tasks,
    required this.ref,
  }) : super(tasks);

  Ref ref;

  List<TaskModel> getList() {
    log.d('[TasksListController] getList()');
    return state;
  }

  List<TaskModel> loadList() {
    log.d('[TasksListController] loadList()');

    final repository = ref.read(repositoryProvider);
    state = repository.getList(ref);

    return state;
  }

  void addTask(TaskModel task) {
    log.d('[TasksListController] addTask($task)');

    final repository = ref.read(repositoryProvider);
    repository.createTask(task);

    state = [...state, task];
  }

  void removeTask(String id) {
    log.d('[TasksListController] removeTask($id)');

    final repository = ref.read(repositoryProvider);
    repository.deleteTask(id);

    state = [
      for (final task in state)
        if (task.id != id) task,
    ];
  }

  void updateTask(TaskModel newTask) {
    log.d('[TasksListController] updateTask($newTask)');

    final repository = ref.read(repositoryProvider);
    repository.updateTask(newTask);

    state = [
      for (final task in state)
        if (task.id == newTask.id)
          task.copyWith(
            isDone: newTask.isDone,
            title: newTask.title,
            priority: newTask.priority,
            createdAt: newTask.createdAt,
            changedAt: newTask.changedAt,
            lastUpdatedBy: newTask.lastUpdatedBy,
            deadlineTime: newTask.deadlineTime,
            color: newTask.color,
          )
        else
          task
    ];
  }
}
