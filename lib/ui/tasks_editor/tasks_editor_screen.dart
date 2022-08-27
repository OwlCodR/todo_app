import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/ui/tasks_editor/widgets/card_text_input.dart';
import 'package:todo_app/ui/tasks_editor/widgets/date_picker.dart';
import 'package:todo_app/ui/tasks_editor/widgets/sliver_app_bar.dart';

import '../../models/domain/task_model.dart';
import '../common/divider.dart';
import '../common/no_glow_scroll_behavior.dart';
import 'widgets/delete_task.dart';
import 'widgets/importance_dropdown.dart';

class TasksEditorScreen extends ConsumerWidget {
  const TasksEditorScreen({
    Key? key,
    this.task,
  }) : super(key: key);

  static const _infoRowHeight = 72.0;
  final TaskModel? task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          scrollBehavior: NoGlowScrollBehavior(),
          slivers: <Widget>[
            TasksEditorSliverAppBar(task: task),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  TasksEditorCardTextInput(
                    title: task?.title,
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Column(
                      children: [
                        Container(
                          constraints: const BoxConstraints(
                            minHeight: _infoRowHeight,
                          ),
                          child: TasksEditorImportanceDropdown(
                            importance: task?.importance,
                          ),
                        ),
                        const CommonDivider(),
                        Container(
                          constraints: const BoxConstraints(
                            minHeight: _infoRowHeight,
                          ),
                          child: TasksEditorDatePicker(
                            deadlineTime: task?.deadlineTime,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const CommonDivider(),
                  const SizedBox(height: 8),
                  TasksEditorDeleteTask(
                    taskId: task?.id,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
