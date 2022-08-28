import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/constants/app_routes.dart';
import 'package:todo_app/providers/navigation/navigation_controller_provider.dart';

class CommonFab extends ConsumerWidget {
  const CommonFab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      backgroundColor:
          Theme.of(context).floatingActionButtonTheme.backgroundColor,
      onPressed: () => ref
          .read(navigationControllerProvider)
          .navigateTo(route: AppRoutes.newTaskEditorRoute),
      child: Icon(
        Icons.add,
        color: Theme.of(context).floatingActionButtonTheme.foregroundColor,
      ),
    );
  }
}
