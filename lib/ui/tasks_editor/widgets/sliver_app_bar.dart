import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/tasks_editor/editor_info_provider.dart';
import 'package:todo_app/ui/common/snackbar.dart';
import 'package:todo_app/ui/tasks_editor/widgets/sliver_app_bar_delegate.dart';

import '../../../models/domain/task_model.dart';
import '../../../providers/tasks_editor/editor_title_provider.dart';
import '../../../providers/tasks_list/tasks_list_provider.dart';
import '../../../utils/logger.dart';

class TasksEditorSliverAppBar extends ConsumerWidget {
  const TasksEditorSliverAppBar({
    Key? key,
    this.task,
  }) : super(key: key);

  final TaskModel? task;
  final _appBarHeight = 56.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: TasksEditorSliverAppBarDelegate(
        height: _appBarHeight,
        onBackPressed: () {
          // TODO Use Navigator 2.0
          Navigator.pop(context);
        },
        onSavePressed: () {
          // TODO Use Navigator 2.0
          if (ref.read(editorTitleProvider(task?.title)).isEmpty) {
            showCommonSnackbar(
              context,
              AppLocalizations.of(context).emptyTitle,
            );
            return;
          }

          final currentTask = ref.read(editorTaskInfoProvider(task));
          log.d('[$runtimeType] initState currentTask: $currentTask');
          if (task != null) {
            ref
                .read(tasksListControllerProvider.notifier)
                .updateTask(currentTask);
          } else {
            ref.read(tasksListControllerProvider.notifier).addTask(currentTask);
          }

          Navigator.pop(context);
        },
      ),
    );
  }
}
