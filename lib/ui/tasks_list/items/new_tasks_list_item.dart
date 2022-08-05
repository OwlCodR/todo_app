import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common/snackbar.dart';

class NewTasksListItem extends StatefulWidget {
  const NewTasksListItem({Key? key}) : super(key: key);

  @override
  State<NewTasksListItem> createState() => _NewTasksListItemState();
}

class _NewTasksListItemState extends State<NewTasksListItem> {
  final _focus = FocusNode();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    debugPrint("Focus: ${_focus.hasFocus.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 48, maxHeight: 84),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              Align(
                alignment: Alignment.center,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                ),
              ),
              const SizedBox(width: 12),
              Flexible(
                child: FocusScope(
                  child: Focus(
                    onFocusChange: (focus) => {
                      // TODO Add Task
                      if (!focus)
                        showCommonSnackbar(context, 'Task has been added')
                    },
                    child: TextField(
                      style: Theme.of(context).textTheme.bodyLarge,
                      decoration: InputDecoration(
                        hintStyle: Theme.of(context).textTheme.titleMedium,
                        hintText: AppLocalizations.of(context).newTask,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
