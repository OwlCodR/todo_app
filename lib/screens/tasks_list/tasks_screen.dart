import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:todo_app/models/task_element.dart';
import 'package:todo_app/screens/tasks_list/no_glow_scroll_behavior.dart';
import 'package:todo_app/screens/tasks_list/tasks_list_item.dart';
import 'package:todo_app/screens/tasks_list/tasks_sliver_app_bar.dart';
import 'package:uuid/uuid.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  final _appBarMinHeight = 64.0;
  final _appBarMaxHeight = 140.0;

  @override
  Widget build(BuildContext context) {
    _setStatusBarColor(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Go to editor screen'),
              duration: Duration(seconds: 1),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).cardColor,
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          scrollBehavior: NoGlowScrollBehavior(),
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: TasksSliverAppBar(
                minHeight: _appBarMinHeight,
                maxHeight: _appBarMaxHeight,
              ),
              pinned: true,
            ),
            SliverStack(
              children: [
                SliverPositioned.fill(
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
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      if (index == 0) {
                        return const SizedBox(height: 8);
                      }
                      return TasksListItem(
                        element: TaskElement(
                          id: const Uuid().v4(),
                          title:
                              'Купить что-то, где-то, зачем-то, но зачем не очень понятно, но точно чтобы показать как обрезаетсz $index Купить что-то, где-то, зачем-то, но зачем не очень понятно, но точно чтобы показать как обрезается ',
                          createdAt: DateTime.now().millisecondsSinceEpoch,
                          changedAt: DateTime.now().millisecondsSinceEpoch,
                          isDone: false,
                          lastUpdatedBy: '99A4D301-53F5-11CB-8CA0-9CA39A9E1F01',
                          priority: 'basic',
                        ),
                      );
                    },
                    childCount: 50,
                  ),
                ),
              ],
            ),
          ],
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
