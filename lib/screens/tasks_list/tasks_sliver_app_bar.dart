import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasksSliverAppBar extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;
  double currentShrinkOffset = 0.0;

  TasksSliverAppBar({required this.minHeight, required this.maxHeight});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    currentShrinkOffset = shrinkOffset;

    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Material(
          elevation: _getProgress(from: 4, to: 0),
          child: Container(
            color: Theme.of(context).primaryColor,
          ),
        ),
        Positioned(
          top: _getProgress(from: 14, to: 81),
          right: _getProgress(from: 19, to: 25),
          child: ClipOval(
            child: Material(
              color: Colors.transparent,
              child: IconTheme(
                data: Theme.of(context).primaryIconTheme,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.visibility),
                  onPressed: () {
                    // TODO Add callback
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Show/Hide completed tasks'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: _getProgress(from: 24, to: 58),
          left: _getProgress(from: 16, to: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context).myTasks,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      letterSpacing: 0.5,
                      height: 24 / 20,
                    ),
                textScaleFactor: _getProgress(from: 1, to: 1.6),
              ),
              Opacity(
                opacity: _getProgress(from: 0, to: 1),
                child: Text(
                  // TODO Add counter
                  AppLocalizations.of(context).completedTasksCounter(0),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  double _getProgress({required double from, required double to}) {
    double delta = maxHeight - minHeight;
    double ratio = 1 - currentShrinkOffset / delta;
    return (currentShrinkOffset < delta) ? (from + ratio * (to - from)) : from;
  }
}
