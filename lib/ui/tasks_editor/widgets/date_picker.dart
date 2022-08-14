import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../providers/tasks_editor/editor_date_time_provider.dart';
import '../../../providers/tasks_editor/editor_switch_state_provider.dart';

class TasksEditorDatePicker extends ConsumerWidget {
  const TasksEditorDatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            Visibility(
              visible: ref.watch(switchStateProvider),
              child: Text(
                DateFormat('d MMMM yyyy').format(ref.watch(dateTimeProvider)),
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

              if (picked != null && picked != ref.read(dateTimeProvider)) {
                ref.read(dateTimeProvider.notifier).update((state) => picked);
              }
            }
          },
        )
      ],
    );
  }
}
