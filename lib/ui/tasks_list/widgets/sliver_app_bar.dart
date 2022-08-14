import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'sliver_app_bar_delegate.dart';

class TasksSliverAppBar extends ConsumerWidget {
  const TasksSliverAppBar({Key? key}) : super(key: key);

  final _appBarMinHeight = 64.0;
  final _appBarMaxHeight = 140.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: TasksSliverAppBarDelegate(
        ref: ref,
        minHeight: _appBarMinHeight,
        maxHeight: _appBarMaxHeight,
      ),
    );
  }
}
