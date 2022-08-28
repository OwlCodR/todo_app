import 'package:todo_app/constants/app_routes.dart';

class TasksRouteConfiguration {
  TasksRouteConfiguration({required this.route, this.taskId});

  final String? taskId;
  AppRoutes route;

  @override
  String toString() {
    return 'TasksRouteConfiguration(route: $route, taskId: $taskId)';
  }
}
