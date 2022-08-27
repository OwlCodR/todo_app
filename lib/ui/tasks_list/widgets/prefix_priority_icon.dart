import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/domain/task_model.dart';

class PrefixPriorityIcon extends StatelessWidget {
  const PrefixPriorityIcon({Key? key, required this.task}) : super(key: key);

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    final prefixPath = task.prefixPath;

    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: prefixPath == null
            ? const SizedBox.shrink()
            : SvgPicture.asset(prefixPath),
      ),
    );
  }
}
