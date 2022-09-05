import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasksEditorSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  TasksEditorSliverAppBarDelegate({
    required this.height,
    required this.onBackPressed,
    required this.onSavePressed,
  });

  final double height;
  final VoidCallback onBackPressed;
  final VoidCallback onSavePressed;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Material(
          elevation: shrinkOffset > 0 ? 4 : 0,
          child: Container(
            color: Theme.of(context).primaryColor,
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: IconButton(
            constraints: const BoxConstraints(),
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.close,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
            onPressed: onBackPressed,
          ),
        ),
        Positioned(
          top: 4,
          right: 16,
          child: TextButton(
            onPressed: onSavePressed,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            child: Text(
              AppLocalizations.of(context).save,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).indicatorColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 24 / 14,
                    letterSpacing: 0.16,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
