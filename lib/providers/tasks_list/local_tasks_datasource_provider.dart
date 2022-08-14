import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../datasources/tasks_local_datasource.dart';

final localTasksDatasourceProvider = Provider<TasksLocalDatasource>(
  (ref) => TasksLocalDatasource(),
);
