import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/navigation/navigation_controller_provider.dart';
import 'package:todo_app/ui/tasks_editor/widgets/sliver_app_bar_delegate.dart';

class TasksEditorSliverAppBar extends ConsumerWidget {
  const TasksEditorSliverAppBar({
    Key? key,
    required this.onSavePressed,
  }) : super(key: key);

  final VoidCallback onSavePressed;
  final _appBarHeight = 56.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: TasksEditorSliverAppBarDelegate(
        height: _appBarHeight,
        onBackPressed: () {
          ref.read(navigationControllerProvider).pop();
        },
        onSavePressed: onSavePressed,
      ),
    );
  }
}
