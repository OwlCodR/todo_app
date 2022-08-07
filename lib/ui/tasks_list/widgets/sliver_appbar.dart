import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/completed_task_visibility_provider.dart';
import 'tasks_sliver_app_bar.dart';

class CustomSliverAppbar extends StatelessWidget {
  const CustomSliverAppbar({Key? key, required this.ref}) : super(key: key);

  final WidgetRef ref;
  final _appBarMinHeight = 64.0;
  final _appBarMaxHeight = 140.0;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: TasksSliverAppBar(
        ref: ref,
        visibilityProvider: completedTaskVisibilityProvider,
        minHeight: _appBarMinHeight,
        maxHeight: _appBarMaxHeight,
      ),
    );
  }
}
