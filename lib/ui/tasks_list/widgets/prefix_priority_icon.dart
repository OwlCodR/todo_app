import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/providers/is_dark_mode_provider.dart';

import '../../../models/domain/task_model.dart';

class PrefixPriorityIcon extends ConsumerWidget {
  const PrefixPriorityIcon({Key? key, required this.task}) : super(key: key);

  final TaskModel task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefixPath = task.prefixPath(ref.watch(isDarkModeProvider));

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
