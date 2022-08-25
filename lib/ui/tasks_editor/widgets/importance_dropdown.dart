import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/tasks_editor/editor_importance_provider.dart';
import '../../../utils/importance_enum.dart';

class TasksEditorImportanceDropdown extends ConsumerWidget {
  const TasksEditorImportanceDropdown({Key? key, this.importance})
      : super(key: key);

  final Importance? importance; // TODO Do I really need it?

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO Make it better
    final currentImportance = ref.watch(importanceProvider);
    var currentImportanceText = AppLocalizations.of(context).basic;

    if (currentImportance == Importance.important) {
      currentImportanceText = AppLocalizations.of(context).important;
    } else if (currentImportance == Importance.low) {
      currentImportanceText = AppLocalizations.of(context).low;
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
              ),
              dropdownPadding: EdgeInsets.zero,
              iconSize: 0,
              dropdownElevation: 1,
              dropdownOverButton: true,
              dropdownWidth: 164,
              itemHeight: 48,
              isExpanded: true,
              onChanged: (importance) {
                ref
                    .read(importanceProvider.notifier)
                    .update((state) => importance as Importance);
              },
              hint: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context).importance,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          height: 18.75 / 16,
                        ),
                  ),
                  Text(
                    currentImportanceText,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              items: [
                DropdownMenuItem<Importance>(
                  value: Importance.basic,
                  child: Text(
                    AppLocalizations.of(context).basic,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          height: 16 / 16,
                        ),
                  ),
                ),
                DropdownMenuItem<Importance>(
                  value: Importance.low,
                  child: Text(
                    AppLocalizations.of(context).low,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          height: 16 / 16,
                        ),
                  ),
                ),
                DropdownMenuItem<Importance>(
                  value: Importance.important,
                  child: Row(
                    children: [
                      Text(
                        '!! ${AppLocalizations.of(context).important}',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              height: 16 / 16,
                              color: Theme.of(context).errorColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
