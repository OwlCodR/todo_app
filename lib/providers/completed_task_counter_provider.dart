import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'tasks_list_provider.dart';

final completedTaskCounterProvider = StateProvider<int>((ref) {
  return ref
      .watch(tasksListProvider.notifier)
      .getList()
      .where((element) => element.isDone)
      .length;
});
