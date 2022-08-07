import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datasources/revision_local_datasource.dart';

final localRevisionDatasourceProvider = Provider<RevisionLocalDatasource>(
  (ref) => RevisionLocalDatasource(),
);
