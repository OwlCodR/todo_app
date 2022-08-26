import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../providers/tasks_editor/editor_date_time_provider.dart';
import '../../../providers/tasks_editor/editor_switch_state_provider.dart';

class TasksEditorDatePicker extends ConsumerStatefulWidget {
  const TasksEditorDatePicker({
    Key? key,
    this.deadlineTime,
  }) : super(key: key);

  final int? deadlineTime;

  @override
  ConsumerState<TasksEditorDatePicker> createState() =>
      _TasksEditorDatePickerState();
}

class _TasksEditorDatePickerState extends ConsumerState<TasksEditorDatePicker> {
  @override
  void initState() {
    super.initState();

    final deadline = widget.deadlineTime;
    final isDeadline = deadline != null;

    ref.read(switchStateProvider.notifier).update((state) => isDeadline);

    if (isDeadline) {
      ref
          .read(dateTimeProvider.notifier)
          .update((state) => DateTime.fromMillisecondsSinceEpoch(deadline));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).doBefore,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    height: 18.75 / 16,
                  ),
            ),
            const SizedBox(height: 4),
            Visibility(
              visible: ref.watch(switchStateProvider),
              child: Text(
                DateFormat('d MMMM yyyy').format(
                  ref.watch(dateTimeProvider),
                ),
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).indicatorColor,
                    ),
              ),
            ),
          ],
        ),
        Switch(
          value: ref.watch(switchStateProvider),
          onChanged: (value) async {
            ref.read(switchStateProvider.notifier).update((state) => value);

            if (value) {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2101),
                helpText: '',
              );

              if (picked == null) return;
              if (picked == ref.read(dateTimeProvider)) return;

              ref.read(dateTimeProvider.notifier).update((state) => picked);
            }
          },
        )
      ],
    );
  }
}
