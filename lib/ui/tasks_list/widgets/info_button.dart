import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/constants/app_paths.dart';
import 'package:todo_app/models/domain/task_model.dart';
import 'package:todo_app/ui/tasks_editor/tasks_editor_screen.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({
    Key? key,
    required this.editingTask,
  }) : super(key: key);

  final TaskModel editingTask;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      onPressed: () {
        // TODO Use Navigator 2.0
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TasksEditorScreen(
              task: editingTask,
            ),
          ),
        );
      },
      icon: SvgPicture.asset(
        AppPaths.info.path,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
