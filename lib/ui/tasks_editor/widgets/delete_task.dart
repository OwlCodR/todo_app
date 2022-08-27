import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/tasks_list/tasks_list_provider.dart';

class TasksEditorDeleteTask extends ConsumerWidget {
  const TasksEditorDeleteTask({
    Key? key,
    this.taskId,
  }) : super(key: key);

  final String? taskId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO May be better to create button instead of "disabling" InkWell
    return InkWell(
      splashColor: taskId != null
          ? Theme.of(context).toggleButtonsTheme.splashColor
          : Colors.transparent,
      highlightColor: taskId != null
          ? Theme.of(context).toggleButtonsTheme.highlightColor
          : Colors.transparent,
      onTap: () {
        if (taskId != null) {
          ref
              .read(tasksListControllerProvider.notifier)
              .removeTask(taskId.toString());
          // TODO Use Navigator 2.0
          Navigator.pop(context);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          constraints: const BoxConstraints(minHeight: 48.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.delete,
                color: taskId == null
                    ? Theme.of(context).disabledColor
                    : Theme.of(context).errorColor,
              ),
              const SizedBox(width: 12),
              Text(
                AppLocalizations.of(context).delete,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: taskId == null
                          ? Theme.of(context).disabledColor
                          : Theme.of(context).errorColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
