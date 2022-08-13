import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'tasks_list_provider.dart';

final completedTaskCounterProvider = Provider<int>((ref) {
  final tasks = ref.watch(tasksListProvider);
  return tasks.where((element) => element.isDone).length;
});
