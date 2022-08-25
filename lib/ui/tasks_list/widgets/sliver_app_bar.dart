import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'sliver_app_bar_delegate.dart';
import '../../../providers/completed_task_visibility_provider.dart';
import '../../../providers/tasks_list_provider.dart';
import 'tasks_sliver_app_bar.dart';

class TasksSliverAppBar extends ConsumerWidget {
  const TasksSliverAppBar({Key? key}) : super(key: key);

  final _appBarMinHeight = 64.0;
  final _appBarMaxHeight = 140.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: TasksSliverAppBarDelegate(
        completedTasksCount: ref
            .watch(
              tasksListProvider.select(
                (list) => list.where((element) => element.isDone),
              ),
            )
            .length,
        onVisibilityButtonPressed: () => ref
            .read(completedTaskVisibilityProvider.notifier)
            .update((state) => !state),
        areCompletedTasksVisible: ref.watch(completedTaskVisibilityProvider),
        minHeight: _appBarMinHeight,
        maxHeight: _appBarMaxHeight,
      ),
    );
  }
}
