import 'package:flutter/material.dart';
import 'package:todo_app/ui/tasks_editor/tasks_editor_screen.dart';
import 'package:todo_app/ui/tasks_list/tasks_screen.dart';

import '../constants/app_routes.dart';
import '../models/domain/tasks_route_configuration.dart';
import '../utils/logger.dart';

class TasksRouterDelegate extends RouterDelegate<TasksRouteConfiguration>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<TasksRouteConfiguration> {
  var _currentConfiguration =
      TasksRouteConfiguration(route: AppRoutes.tasksListRoute);

  TasksRouteConfiguration get configuration => _currentConfiguration;
  set configuration(TasksRouteConfiguration configuration) {
    _currentConfiguration = configuration;
    notifyListeners();
  }

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(TasksRouteConfiguration configuration) async {
    log.d('[$runtimeType] setNewRoutePath(configuration: $configuration)');
    _currentConfiguration = configuration;
  }

  @override
  TasksRouteConfiguration get currentConfiguration => _currentConfiguration;

  bool _handlePopPage(Route<dynamic> route, dynamic result) {
    log.d('[$runtimeType] _handlePopPage(route: $route, result: $result)');

    final bool success = route.didPop(result);

    if (success) {
      _currentConfiguration.route = AppRoutes.tasksListRoute;
      notifyListeners();
    }
    return success;
  }

  @override
  Widget build(BuildContext context) {
    log.d('[$runtimeType] _currentConfiguration = $_currentConfiguration');
    return Navigator(
      key: navigatorKey,
      pages: <Page<void>>[
        MaterialPage(
          key: ValueKey(AppRoutes.tasksListRoute.name),
          child: const TasksScreen(),
        ),
        if (_currentConfiguration.route == AppRoutes.newTaskEditorRoute)
          MaterialPage(
            key: ValueKey(AppRoutes.newTaskEditorRoute.name),
            child: const TasksEditorScreen(),
          ),
        if (_currentConfiguration.route == AppRoutes.taskEditorRoute)
          MaterialPage(
            key: ValueKey(AppRoutes.taskEditorRoute.name),
            child:
                TasksEditorScreen(editableTaskId: _currentConfiguration.taskId),
          ),
      ],
      onPopPage: _handlePopPage,
    );
  }
}
