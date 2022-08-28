import 'package:flutter/material.dart';

class TasksEditorSliverSircularProgressBar extends StatelessWidget {
  const TasksEditorSliverSircularProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverPadding(
      padding: EdgeInsets.only(top: 16.0),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: SizedBox(
            width: 32,
            height: 32,
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
