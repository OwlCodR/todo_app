import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/navigation/navigation_controller_provider.dart';
import 'package:todo_app/providers/tasks_list/tasks_list_provider.dart';
import 'package:todo_app/ui/tasks_editor/widgets/editor_sliver_list.dart';
import 'package:todo_app/ui/tasks_editor/widgets/sliver_app_bar.dart';
import 'package:todo_app/ui/tasks_editor/widgets/sliver_circular_progress_bar.dart';

import '../../models/domain/task_model.dart';
import '../../providers/is_dark_mode_provider.dart';
import '../../providers/tasks_editor/editor_info_provider.dart';
import '../../providers/tasks_editor/editor_title_provider.dart';
import '../../utils/logger.dart';
import '../common/no_glow_scroll_behavior.dart';

class TasksEditorScreen extends ConsumerStatefulWidget {
  const TasksEditorScreen({
    Key? key,
    this.editableTaskId,
  }) : super(key: key);

  final String? editableTaskId;

  @override
  ConsumerState<TasksEditorScreen> createState() => _TasksEditorScreenState();
}

class _TasksEditorScreenState extends ConsumerState<TasksEditorScreen> {
  TaskModel? editableTask;

  void _onSavePressed() {
    if (ref.read(editorTitleProvider(editableTask?.title)).isEmpty) {
      ref.read(navigationControllerProvider).showSnackbar(
            text: AppLocalizations.of(context).emptyTitle,
          );
      return;
    }

    final currentTask = ref.read(editorTaskInfoProvider(editableTask));
    log.d('[$runtimeType] initState currentTask: $currentTask');

    if (editableTask != null) {
      ref.read(tasksListControllerProvider.notifier).updateTask(currentTask);
    } else {
      ref.read(tasksListControllerProvider.notifier).addTask(currentTask);
    }

    ref.read(navigationControllerProvider).pop();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor.withOpacity(.20),
        statusBarIconBrightness: ref.watch(isDarkModeProvider)
            ? Brightness.light
            : Brightness.dark, // For Android (dark icons)
        statusBarBrightness: ref.watch(isDarkModeProvider)
            ? Brightness.dark
            : Brightness.light, // For iOS (dark icons)
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          scrollBehavior: NoGlowScrollBehavior(),
          slivers: <Widget>[
            TasksEditorSliverAppBar(onSavePressed: _onSavePressed),
            widget.editableTaskId == null
                ? const TasksEditorSliverList(editableTask: null)
                : FutureBuilder(
                    future: ref
                        .read(tasksListControllerProvider.notifier)
                        .getTask(widget.editableTaskId!),
                    builder: (context, AsyncSnapshot<TaskModel?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        editableTask = snapshot.data;
                        return TasksEditorSliverList(
                          editableTask: editableTask,
                        );
                      } else {
                        if (snapshot.hasError) {
                          ref.read(navigationControllerProvider).showSnackbar(
                                text: AppLocalizations.of(context)
                                    .errorLoadingEditor,
                              );
                          ref.read(navigationControllerProvider).pop();
                        }
                        return const TasksEditorSliverSircularProgressBar();
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
