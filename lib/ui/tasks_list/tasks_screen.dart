import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:todo_app/datasources/revision_local_datasource.dart';
import 'package:todo_app/datasources/tasks_local_datasource.dart';
import 'package:todo_app/datasources/tasks_remote_datasource.dart';
import 'package:todo_app/repositories/tasks_repository.dart';
import 'package:todo_app/ui/common/fab.dart';
import 'package:todo_app/ui/tasks_list/items/new_tasks_list_item.dart';

import '../../controllers/tasks_list_controller.dart';
import '../../models/task_model.dart';
import '../common/no_glow_scroll_behavior.dart';
import 'items/tasks_list_item.dart';
import 'tasks_sliver_app_bar.dart';

final completedTaskVisibilityProvider = StateProvider<bool>((ref) => false);

final localTasksDatasourceProvider = Provider<TasksLocalDatasource>(
  (ref) => TasksLocalDatasource.getInstance(),
);

final remoteTasksDatasourceProvider = Provider<TasksRemoteDatasource>(
  (ref) => TasksRemoteDatasource.getInstance(),
);

final localRevisionDatasourceProvider = Provider<RevisionLocalDatasource>(
  (ref) => RevisionLocalDatasource.getInstance(),
);

final repositoryProvider = Provider<TaskRepository>((ref) {
  final localTasksDatasource = ref.read(localTasksDatasourceProvider);
  final localRevisionDatasource = ref.read(localRevisionDatasourceProvider);
  final remoteTasksDatasource = ref.read(remoteTasksDatasourceProvider);

  return TaskRepository(
    localTasksDatasource,
    localRevisionDatasource,
    remoteTasksDatasource,
  );
});

final tasksListController =
    StateNotifierProvider<TasksListController, List<TaskModel>>(
  (ref) {
    final repository = ref.read(repositoryProvider);
    return TasksListController(tasks: repository.getList(ref), ref: ref);
  },
);

final visibleTasksListProvider = StateProvider<List<TaskModel>>((ref) {
  final areCompletedTasksVisible = ref.watch(completedTaskVisibilityProvider);

  return ref
      .watch(tasksListController.notifier)
      .getList()
      .where((element) =>
          !element.isDone || element.isDone == areCompletedTasksVisible)
      .toList();
});

final completedTaskCounterProvider = StateProvider<int>((ref) {
  return ref
      .watch(tasksListController.notifier)
      .getList()
      .where((element) => element.isDone)
      .length;
});

class TasksScreen extends ConsumerWidget {
  const TasksScreen({Key? key}) : super(key: key);

  final _appBarMinHeight = 64.0;
  final _appBarMaxHeight = 140.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _setStatusBarColor(context);

    return Scaffold(
      floatingActionButton: const CommonFab(),
      body: SafeArea(
        child: CustomScrollView(
          scrollBehavior: NoGlowScrollBehavior(),
          slivers: <Widget>[
            _sliverAppBar(ref),
            SliverStack(
              children: [
                _sliverBackgroundCard(context),
                _sliverListTasks(ref),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _sliverAppBar(WidgetRef ref) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: TasksSliverAppBar(
        ref: ref,
        visibilityProvider: completedTaskVisibilityProvider,
        minHeight: _appBarMinHeight,
        maxHeight: _appBarMaxHeight,
      ),
    );
  }

  Widget _sliverListTasks(WidgetRef ref) {
    final tasks = ref.watch(visibleTasksListProvider);
    final elementsCount = tasks.length + 3;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index == 0 || index == elementsCount - 1) {
            return const SizedBox(height: 8);
          }

          if (index == elementsCount - 2) {
            return NewTasksListItem(
              ref: ref,
              tasksProvider: tasksListController,
              visibleTasks: visibleTasksListProvider,
            );
          }

          return TasksListItem(
            task: tasks.elementAt(index - 1),
            tasksProvider: tasksListController,
            ref: ref,
          );
        },
        childCount: elementsCount,
      ),
    );
  }

  Widget _sliverBackgroundCard(BuildContext context) {
    return SliverPositioned.fill(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          margin: EdgeInsets.zero,
          color: Theme.of(context).cardTheme.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  void _setStatusBarColor(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );
  }
}
