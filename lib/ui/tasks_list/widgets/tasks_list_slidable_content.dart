import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/domain/task_model.dart';
import '../../../utils/importance_enum.dart';
import 'deadline_text.dart';
import 'info_button.dart';
import 'prefix_priority_icon.dart';
import 'title_text.dart';

class TasksListSlidableContent extends ConsumerWidget {
  const TasksListSlidableContent({
    Key? key,
    required this.task,
  }) : super(key: key);

  final TaskModel task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 48, maxHeight: 108),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Wrap(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SvgPicture.asset(
                //   task.checkboxPath(
                //     ref.watch(isDarkModeProvider),
                //   ),
                // ),
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: task.importance == Importance.important
                        ? Theme.of(context).errorColor.withOpacity(0.16)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    checkColor: Theme.of(context).backgroundColor,
                    fillColor:
                        task.importance == Importance.important && !task.isDone
                            ? Theme.of(context).checkboxTheme.checkColor
                            : Theme.of(context).checkboxTheme.fillColor,
                    value: task.isDone,
                    onChanged: (state) {},
                  ),
                ),
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
                InfoButton(editingTask: task),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
