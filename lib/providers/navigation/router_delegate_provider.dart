import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/navigation/tasks_router_delegate.dart';

final routerDelegateProvider = Provider((ref) => TasksRouterDelegate());
