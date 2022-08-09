import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/tasks_repository.dart';
import 'local_revision_datasource_provider.dart';
import 'local_tasks_datasource_provider.dart';
import 'remote_tasks_datasource_provider.dart';

final repositoryProvider = Provider<TaskRepository>((ref) {
  final localTasksDatasource = ref.read(localTasksDatasourceProvider);
  final localRevisionDatasource = ref.read(localRevisionDatasourceProvider);
  final remoteTasksDatasource = ref.read(remoteTasksDatasourceProvider);

  return TaskRepository(
    localTasksDatasource,
    localRevisionDatasource,
    remoteTasksDatasource,
  );
});
