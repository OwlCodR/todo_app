import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:todo_app/ui/common/fab.dart';
import 'package:todo_app/ui/tasks_list/items/new_tasks_list_item.dart';
import 'package:uuid/uuid.dart';

import '../../models/task_element_response.dart';
import '../common/no_glow_scroll_behavior.dart';
import 'items/tasks_list_item.dart';
import 'tasks_sliver_app_bar.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  final _appBarMinHeight = 64.0;
  final _appBarMaxHeight = 140.0;
  final count = 4;

  @override
  Widget build(BuildContext context) {
    _setStatusBarColor(context);

    return Scaffold(
      floatingActionButton: const CommonFab(),
      body: SafeArea(
        child: CustomScrollView(
          scrollBehavior: NoGlowScrollBehavior(),
          slivers: <Widget>[
            _sliverAppBar(),
            SliverStack(
              children: [
                _sliverBackgroundCard(context),
                _sliverListTasks(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _sliverAppBar() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: TasksSliverAppBar(
        minHeight: _appBarMinHeight,
        maxHeight: _appBarMaxHeight,
      ),
    );
  }

  Widget _sliverListTasks() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index == count - 2) return const NewTasksListItem();
          if (index == 0 || index == count - 1) {
            return const SizedBox(height: 8);
          }

          return TasksListItem(
            element: TaskElementResponse(
              id: const Uuid().v4(),
              title: 'Купить что-то, где-то, зачем-то, но зачем не '
                  'очень понятно, но точно чтобы показать как '
                  'обрезаетсz $index Купить что-то, где-то, '
                  'зачем-то, но зачем не очень понятно, но '
                  'точно чтобы показать как обрезается ',
              createdAt: DateTime.now().millisecondsSinceEpoch,
              changedAt: DateTime.now().millisecondsSinceEpoch,
              isDone: false,
              lastUpdatedBy: '99A4D301-53F5-11CB-8CA0-9CA39A9E1F01',
              priority: 'basic',
            ),
          );
        },
        childCount: count,
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
