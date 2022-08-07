import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/controllers/tasks_list_controller.dart';
import 'package:uuid/uuid.dart';

import '../../../models/task_model.dart';
import '../../../utils/logger.dart';

class NewTasksListItem extends StatefulWidget {
  const NewTasksListItem({
    Key? key,
    required this.ref,
    required this.tasksProvider,
    required this.visibleTasks,
  }) : super(key: key);

  final WidgetRef ref;
  final StateNotifierProvider<TasksListController, List<TaskModel>>
      tasksProvider;
  final StateProvider<List<TaskModel>> visibleTasks;

  @override
  State<NewTasksListItem> createState() => _NewTasksListItemState();
}

class _NewTasksListItemState extends State<NewTasksListItem> {
  final _focus = FocusNode();
  String _title = '';

  late StreamSubscription<bool> keyboardSubscription;

  void _createTask() {
    final model = TaskModel(
      id: const Uuid().v4(),
      isDone: false,
      title: _title,
      priority: TaskModel.basicPriority,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      changedAt: DateTime.now().millisecondsSinceEpoch,
      lastUpdatedBy: 'dsfsdfsdf', // TODO Set lastUpdatedBy
    );

    log.d('Created model: $model');
    widget.ref.read(widget.tasksProvider.notifier).addTask(model);
    widget.ref.refresh(widget.visibleTasks);
  }

  void _onFocusChange() {
    if (!_focus.hasFocus) {
      _createTask();
    }
  }

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);

    keyboardSubscription = KeyboardVisibilityController().onChange.listen(
      (bool visible) {
        if (!visible) _focus.unfocus();
      },
    );
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 48, maxHeight: 84),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              Align(
                alignment: Alignment.center,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                ),
              ),
              const SizedBox(width: 12),
              Flexible(
                child: TextField(
                  focusNode: _focus,
                  onChanged: (title) => _title = title,
                  style: Theme.of(context).textTheme.bodyLarge,
                  decoration: InputDecoration(
                    hintStyle: Theme.of(context).textTheme.titleMedium,
                    hintText: AppLocalizations.of(context).newTask,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
