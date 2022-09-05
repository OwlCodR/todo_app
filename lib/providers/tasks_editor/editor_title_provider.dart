import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/domain/task_model.dart';

final editorTitleProvider = StateProvider.family<String, TaskModel?>(
  (ref, task) => task?.title ?? '',
);
