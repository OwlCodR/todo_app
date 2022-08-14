import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/constants/app_paths.dart';
import 'package:todo_app/models/domain/task_model.dart';

import '../../../utils/importance_enum.dart';

class PrefixPriorityIcon extends StatelessWidget {
  const PrefixPriorityIcon({Key? key, required this.task}) : super(key: key);

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    Widget icon = Container();

    if (!task.isDone) {
      if (task.importance == Importance.important) {
        icon = SvgPicture.asset(AppPaths.prefixImportnantPriority);
      }

      if (task.importance == Importance.low) {
        icon = SvgPicture.asset(AppPaths.prefixLowPriority);
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
