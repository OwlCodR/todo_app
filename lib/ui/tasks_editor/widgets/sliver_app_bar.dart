import 'package:flutter/material.dart';
import 'package:todo_app/ui/tasks_editor/widgets/sliver_app_bar_delegate.dart';

class TasksEditorSliverAppBar extends StatelessWidget {
  const TasksEditorSliverAppBar({Key? key}) : super(key: key);

  final _appBarHeight = 56.0;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: TasksEditorSliverAppBarDelegate(
        height: _appBarHeight,
      ),
    );
  }
}
