import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/tasks_editor/editor_title_provider.dart';
import '../../../utils/logger.dart';

class TasksEditorCardTextInput extends ConsumerStatefulWidget {
  const TasksEditorCardTextInput({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  ConsumerState<TasksEditorCardTextInput> createState() =>
      _TasksEditorCardTextInputState();
}

class _TasksEditorCardTextInputState
    extends ConsumerState<TasksEditorCardTextInput> {
  @override
  void initState() {
    super.initState();

    final title = widget.title ?? '';
    ref.read(editorTitleProvider.notifier).update((state) => title);
  }

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
              onChanged: (title) {
                log.d('[$runtimeType] initState title: $title');
                ref.read(editorTitleProvider.notifier).update((state) => title);
              },
              controller: TextEditingController(
                text: ref.read(editorTitleProvider),
              ),
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
