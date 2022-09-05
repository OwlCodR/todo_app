import 'package:flutter/material.dart';

import '../../../models/domain/task_model.dart';
import '../../common/divider.dart';
import 'card_text_input.dart';
import 'date_picker.dart';
import 'delete_task.dart';
import 'importance_dropdown.dart';

class TasksEditorSliverList extends StatelessWidget {
  const TasksEditorSliverList({
    Key? key,
    required this.editableTask,
  }) : super(key: key);

  static const _infoRowHeight = 72.0;
  final TaskModel? editableTask;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          TasksEditorCardTextInput(
            editableTask: editableTask,
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
                    importance: editableTask?.importance,
                  ),
                ),
                const CommonDivider(),
                Container(
                  constraints: const BoxConstraints(
                    minHeight: _infoRowHeight,
                  ),
                  child: TasksEditorDatePicker(
                    deadlineTime: editableTask?.deadlineTime,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const CommonDivider(),
          const SizedBox(height: 8),
          TasksEditorDeleteTask(
            taskId: editableTask?.id,
          ),
        ],
      ),
    );
  }
}
