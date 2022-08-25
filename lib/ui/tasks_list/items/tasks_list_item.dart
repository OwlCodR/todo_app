import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/providers/tasks_list_provider.dart';

import '../../../models/domain/task_model.dart';
import '../widgets/end_action_pane_content.dart';
import '../widgets/start_action_pane_content.dart';
import '../widgets/tasks_list_slidable_content.dart';
import '../../../utils/importance_enum.dart';

class TasksListItem extends ConsumerWidget {
  const TasksListItem({
    Key? key,
    required this.task,
  }) : super(key: key);

  final TaskModel task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget checkboxIcon = SvgPicture.asset(AppPaths.unchecked);

    if (task.isDone) {
      checkboxIcon = SvgPicture.asset(AppPaths.checked);
    } else if (task.importance == Importance.important) {
      checkboxIcon = SvgPicture.asset(AppPaths.uncheckedImportant);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRect(
        child: Slidable(
          key: UniqueKey(),
          startActionPane: ActionPane(
            dismissible: DismissiblePane(
              onDismissed: () {
                ref.read(tasksListProvider.notifier).updateTask(
                      task.copyWith(isDone: !task.isDone),
                    );
              },
            ),
            motion: const ScrollMotion(),
            children: const [StartActionPaneContent()],
          ),
          endActionPane: ActionPane(
            dismissible: DismissiblePane(onDismissed: () {
              ref.read(tasksListProvider.notifier).removeTask(task.id);
            }),
            motion: const ScrollMotion(),
            children: const [EndActionPaneContent()],
          ),
          child: TasksListSlidableContent(task: task),
        ),
      ),
    );
  }
}
