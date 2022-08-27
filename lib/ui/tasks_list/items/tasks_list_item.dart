import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/providers/tasks_list/tasks_list_provider.dart';

import '../../../models/domain/task_model.dart';
import '../widgets/end_action_pane_content.dart';
import '../widgets/start_action_pane_content.dart';
import '../widgets/tasks_list_slidable_content.dart';

class TasksListItem extends ConsumerWidget {
  const TasksListItem({
    Key? key,
    required this.task,
  }) : super(key: key);

  final TaskModel task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRect(
        child: Slidable(
          key: UniqueKey(),
          startActionPane: ActionPane(
            extentRatio: 0.2,
            openThreshold: 0.9,
            closeThreshold: 0.9,
            dismissible: DismissiblePane(
              onDismissed: () {
                ref.read(tasksListControllerProvider.notifier).updateTask(
                      task.copyWith(isDone: !task.isDone),
                    );
              },
            ),
            motion: const ScrollMotion(),
            children: const [StartActionPaneContent()],
          ),
          endActionPane: ActionPane(
            extentRatio: 0.2,
            openThreshold: 0.9,
            closeThreshold: 0.9,
            dismissible: DismissiblePane(
              onDismissed: () {
                ref
                    .read(tasksListControllerProvider.notifier)
                    .removeTask(task.id);
              },
            ),
            motion: const ScrollMotion(),
            children: const [EndActionPaneContent()],
          ),
          child: TasksListSlidableContent(task: task),
        ),
      ),
    );
  }
}
