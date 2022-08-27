import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/domain/task_model.dart';
import '../../../providers/is_dark_mode_provider.dart';
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
                SvgPicture.asset(
                  task.checkboxPath(
                    ref.watch(isDarkModeProvider),
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
