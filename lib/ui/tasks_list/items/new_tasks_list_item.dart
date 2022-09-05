import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/tasks_list/tasks_list_provider.dart';

import '../../../providers/navigation/navigation_controller_provider.dart';

class NewTasksListItem extends ConsumerStatefulWidget {
  const NewTasksListItem({Key? key}) : super(key: key);

  @override
  ConsumerState<NewTasksListItem> createState() => _NewTasksListItemState();
}

class _NewTasksListItemState extends ConsumerState<NewTasksListItem> {
  late final _focus = FocusNode();
  var _title = '';

  late StreamSubscription<bool> keyboardSubscription;

  void _onFocusChange() {
    if (!_focus.hasFocus) {
      if (_title.isNotEmpty) {
        ref.read(tasksListControllerProvider.notifier).addDefaultTask(_title);
        return;
      }

      ref.read(navigationControllerProvider).showSnackbar(
            text: AppLocalizations.of(context).emptyTitle,
          );
    }
  }

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);

    keyboardSubscription = KeyboardVisibilityController().onChange.listen(
      (bool visible) {
        if (!visible) _focus.unfocus();
      },
    );
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 48,
        maxHeight: 84,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Icon(Icons.add),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: MediaQuery.of(context).size.width - 144,
              child: TextField(
                maxLines: 1,
                focusNode: _focus,
                onChanged: (title) => _title = title,
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: InputDecoration(
                  isDense: true,
                  hintStyle: Theme.of(context).textTheme.titleMedium,
                  hintText: AppLocalizations.of(context).newTask,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
