import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/screens/tasks_list/tasks_sliver_app_bar.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  final _appBarMinHeight = 88.0;
  final _appBarMaxHeight = 164.0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
      ),
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: TasksSliverAppBar(
              minHeight: _appBarMinHeight,
              maxHeight: _appBarMaxHeight,
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
