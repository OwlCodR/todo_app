import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/models/task_model.dart';

class PrefixPriorityIcon extends StatelessWidget {
  const PrefixPriorityIcon({Key? key, required this.task}) : super(key: key);

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    Widget icon = Container();

    if (!task.isDone) {
      if (task.priority == TaskModel.importantPriority) {
        icon = SvgPicture.asset('assets/images/prefix_important_priority.svg');
      }

      if (task.priority == TaskModel.lowPriority) {
        icon = SvgPicture.asset('assets/images/prefix_low_priority.svg');
      }
    }

    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: icon,
      ),
    );
  }
}
