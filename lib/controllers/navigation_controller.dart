import 'package:flutter/material.dart';
import 'package:todo_app/models/domain/tasks_route_configuration.dart';
import 'package:todo_app/navigation/tasks_router_delegate.dart';

import '../constants/app_routes.dart';
import '../utils/logger.dart';

class NavigationController {
  NavigationController({
    required this.routerDelegate,
    required this.scaffoldMessengerState,
  });

  final TasksRouterDelegate routerDelegate;
  final ScaffoldMessengerState scaffoldMessengerState;

  void navigateTo({
    required AppRoutes route,
    String? taskId,
  }) {
    routerDelegate.configuration =
        TasksRouteConfiguration(route: route, taskId: taskId);
  }

  void showSnackbar({
    required String text,
    Duration duration = const Duration(seconds: 2),
  }) {
    log.d('[$runtimeType] showSnackbar(text: $text, duration: $duration)');
    scaffoldMessengerState.showSnackBar(
      SnackBar(
        content: Text(text),
        duration: duration,
      ),
    );
  }

  void pop() {
    routerDelegate.popRoute();
  }
}
