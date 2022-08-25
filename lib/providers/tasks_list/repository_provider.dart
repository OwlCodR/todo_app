import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repositories/tasks_repository.dart';
import 'local_revision_datasource_provider.dart';
import 'local_tasks_datasource_provider.dart';
import 'remote_tasks_datasource_provider.dart';

final repositoryProvider = Provider((ref) {
  final localTasksDatasource = ref.watch(localTasksDatasourceProvider);
  final localRevisionDatasource = ref.watch(localRevisionDatasourceProvider);
  final remoteTasksDatasource = ref.watch(remoteTasksDatasourceProvider);

  return TasksRepository(
    localTasksDatasource,
    localRevisionDatasource,
    remoteTasksDatasource,
  );
});
