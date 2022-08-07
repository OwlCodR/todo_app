import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datasources/tasks_remote_datasource.dart';

final remoteTasksDatasourceProvider = Provider<TasksRemoteDatasource>(
  (ref) => TasksRemoteDatasource.getInstance(),
);
