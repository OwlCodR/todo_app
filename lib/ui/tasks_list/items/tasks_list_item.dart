import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/providers/tasks_list_provider.dart';
import 'package:todo_app/ui/tasks_list/widgets/deadline_text.dart';
import 'package:todo_app/ui/tasks_list/widgets/info_button.dart';
import 'package:todo_app/ui/tasks_list/widgets/prefix_priority_icon.dart';
import 'package:todo_app/ui/tasks_list/widgets/title_text.dart';

import '../../../models/task_model.dart';

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
          startActionPane: _startActionPane(context, ref),
          endActionPane: _endActionPane(context, ref),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 48, maxHeight: 108),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Wrap(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(task.checkboxPath),
                      const SizedBox(width: 12),
                      PrefixPriorityIcon(task: task),
                      Expanded(
                        child: Column(
                          children: [
                            TitleText(title: task.title, isDone: task.isDone),
                            DeadlineText(deadline: task.deadlineTime),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      const InfoButton(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ActionPane _startActionPane(BuildContext context, WidgetRef ref) {
    return ActionPane(
      dismissible: DismissiblePane(
        onDismissed: () {
          ref.read(tasksListProvider.notifier).updateTask(
                task.copyWith(isDone: !task.isDone),
              );
        },
      ),
      motion: const ScrollMotion(),
      children: [
        Expanded(
          child: Container(
            color: Theme.of(context).primaryColorLight,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Icon(
                  Icons.check,
                  color: Theme.of(context).cardColor,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  ActionPane _endActionPane(BuildContext context, WidgetRef ref) {
    return ActionPane(
      dismissible: DismissiblePane(onDismissed: () {
        ref.read(tasksListProvider.notifier).removeTask(task.id);
      }),
      motion: const ScrollMotion(),
      children: [
        Expanded(
          child: Container(
            color: Theme.of(context).errorColor,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Icon(
                  Icons.delete,
                  color: Theme.of(context).cardColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
