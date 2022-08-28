import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/constants/app_paths.dart';
import 'package:todo_app/models/domain/task_model.dart';

import '../../../constants/app_routes.dart';
import '../../../providers/navigation/navigation_controller_provider.dart';

class InfoButton extends ConsumerWidget {
  const InfoButton({
    Key? key,
    required this.editableTask,
  }) : super(key: key);

  final TaskModel editableTask;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: IconTheme(
          data: Theme.of(context).primaryIconTheme,
          child: IconButton(
            constraints: const BoxConstraints(),
            padding: EdgeInsets.zero,
            icon: SvgPicture.asset(
              AppPaths.info.path,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              ref
                  .read(
                    navigationControllerProvider,
                  )
                  .navigateTo(
                    route: AppRoutes.taskEditorRoute,
                    taskId: editableTask.id,
                  );
            },
          ),
        ),
      ),
    );
  }
}
