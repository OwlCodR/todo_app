import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DeadlineText extends StatelessWidget {
  const DeadlineText({Key? key, required this.deadline}) : super(key: key);

  final int? deadline;

  @override
  Widget build(BuildContext context) {
    if (deadline == null) return SizedBox.shrink();
    final dateTime = DateTime.fromMillisecondsSinceEpoch(deadline!);

    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        DateFormat('d MMMM yyyy').format(dateTime),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
