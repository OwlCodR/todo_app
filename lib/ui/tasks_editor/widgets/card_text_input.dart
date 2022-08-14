import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasksEditorCardTextInput extends StatelessWidget {
  const TasksEditorCardTextInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 104),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.all(8),
          child: Align(
            alignment: Alignment.topLeft,
            child: TextField(
              maxLines: null,
              onChanged: (value) {},
              style: Theme.of(context).textTheme.bodyLarge,
              decoration: InputDecoration(
                hintStyle: Theme.of(context).textTheme.titleMedium,
                hintText: AppLocalizations.of(context).task,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: const EdgeInsets.all(16.0),
                isDense: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
