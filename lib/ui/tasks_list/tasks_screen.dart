import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:todo_app/ui/common/fab.dart';
import 'package:todo_app/ui/tasks_list/widgets/sliver_list_tasks.dart';

import '../common/no_glow_scroll_behavior.dart';
import 'widgets/sliver_appbar.dart';
import 'widgets/sliver_background_card.dart';

class TasksScreen extends ConsumerWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );

    return Scaffold(
      floatingActionButton: const CommonFab(),
      body: SafeArea(
        child: CustomScrollView(
          scrollBehavior: NoGlowScrollBehavior(),
          slivers: <Widget>[
            const CustomSliverAppbar(),
            SliverStack(
              children: const [
                SliverBackgroundCard(),
                SliverListTasks(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
