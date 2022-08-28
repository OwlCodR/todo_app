import 'package:flutter/material.dart';
import 'package:todo_app/constants/app_routes.dart';
import 'package:todo_app/models/domain/tasks_route_configuration.dart';

import '../utils/logger.dart';

class TasksRouterInformationParser
    extends RouteInformationParser<TasksRouteConfiguration> {
  @override
  Future<TasksRouteConfiguration> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final routeName = routeInformation.location;
    log.d('[$runtimeType] parseRouteInformation() routeName: $routeName');

    if (routeName == null) {
      return TasksRouteConfiguration(route: AppRoutes.unknownRoute);
    }

    if (routeName == AppRoutes.tasksListRoute.name) {
      return TasksRouteConfiguration(route: AppRoutes.tasksListRoute);
    } else if (routeName == AppRoutes.newTaskEditorRoute.name) {
      return TasksRouteConfiguration(route: AppRoutes.newTaskEditorRoute);
    } else if (routeName.contains(AppRoutes.taskEditorRoute.name)) {
      final uuid = routeName.split('${AppRoutes.taskEditorRoute.name}/')[1];
      return TasksRouteConfiguration(
        route: AppRoutes.taskEditorRoute,
        taskId: uuid,
      );
    }

    throw 'Unknown route';
  }

  @override
  RouteInformation restoreRouteInformation(
    TasksRouteConfiguration configuration,
  ) {
    log.d(
        '[$runtimeType] restoreRouteInformation() configuration.route: ${configuration.route}');

    switch (configuration.route) {
      case AppRoutes.unknownRoute:
        return RouteInformation(location: AppRoutes.unknownRoute.name);
      case AppRoutes.tasksListRoute:
        return RouteInformation(location: AppRoutes.tasksListRoute.name);
      case AppRoutes.newTaskEditorRoute:
        return RouteInformation(location: AppRoutes.newTaskEditorRoute.name);
      case AppRoutes.taskEditorRoute:
        if (configuration.taskId == null) {
          return RouteInformation(
            location: AppRoutes.taskEditorRoute.name,
          );
        } else {
          return RouteInformation(
            location:
                '${AppRoutes.taskEditorRoute.name}/${configuration.taskId ?? ''}',
          );
        }
    }
  }
}
