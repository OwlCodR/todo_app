import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/models/task_model.dart';

import 'deadline_text.dart';
import 'info_button.dart';
import 'prefix_priority_icon.dart';
import 'title_text.dart';

class TasksListSlidableContent extends StatelessWidget {
  const TasksListSlidableContent({
    Key? key,
    required this.task,
  }) : super(key: key);

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
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
    );
  }
}
