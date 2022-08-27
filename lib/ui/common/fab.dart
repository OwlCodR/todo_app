import 'package:flutter/material.dart';

import '../tasks_editor/tasks_editor_screen.dart';

class CommonFab extends StatelessWidget {
  const CommonFab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO Use Navigator 2.0
    return FloatingActionButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TasksEditorScreen(),
        ),
      ),
      child: Icon(
        Icons.add,
        color: Theme.of(context).cardColor,
      ),
    );
  }
}
