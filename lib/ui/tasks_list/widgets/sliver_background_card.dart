import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverBackgroundCard extends StatelessWidget {
  const SliverBackgroundCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPositioned.fill(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          margin: EdgeInsets.zero,
          color: Theme.of(context).cardTheme.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
