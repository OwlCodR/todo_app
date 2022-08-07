import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/visible_tasks_list_provider.dart';
import '../items/new_tasks_list_item.dart';
import '../items/tasks_list_item.dart';

class SliverListTasks extends StatelessWidget {
  const SliverListTasks({Key? key, required this.ref}) : super(key: key);

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(visibleTasksListProvider);
    final elementsCount = tasks.length + 3;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index == 0 || index == elementsCount - 1) {
            return const SizedBox(height: 8);
          }

          if (index == elementsCount - 2) {
            return const NewTasksListItem();
          }

          return TasksListItem(task: tasks.elementAt(index - 1));
        },
        childCount: elementsCount,
      ),
    );
  }
}
