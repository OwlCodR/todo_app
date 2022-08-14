import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/models/domain/task_model.dart';

class TasksEditorDeleteTask extends StatelessWidget {
  const TasksEditorDeleteTask({
    Key? key,
    this.editingTask,
  }) : super(key: key);

  final TaskModel? editingTask;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        constraints: const BoxConstraints(minHeight: 48.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.delete,
              color: editingTask == null
                  ? Theme.of(context).disabledColor
                  : Theme.of(context).errorColor,
            ),
            const SizedBox(width: 12),
            Text(
              AppLocalizations.of(context).delete,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: editingTask == null
                        ? Theme.of(context).disabledColor
                        : Theme.of(context).errorColor,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
