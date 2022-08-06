import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../models/task_model.dart';
import '../../common/snackbar.dart';

class TasksListItem extends StatelessWidget {
  const TasksListItem({Key? key, required this.task}) : super(key: key);

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRect(
        child: Slidable(
          key: UniqueKey(),
          startActionPane: _startActionPane(context),
          endActionPane: _endActionPane(context),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 48, maxHeight: 108),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Wrap(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _itemCheckbox(),
                      const SizedBox(width: 12),
                      _itemPrefixPriority(),
                      Expanded(
                        child: Column(
                          children: [
                            _itemTitle(context),
                            _itemDeadline(context),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      _itemInfoButton(context),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemPrefixPriority() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: _itemPrefixPriorityIcon(),
      ),
    );
  }

  Widget _itemPrefixPriorityIcon() {
    if (task.isDone) return Container();

    if (task.priority == TaskModel.importantPriority) {
      return SvgPicture.asset('assets/images/prefix_important_priority.svg');
    }

    if (task.priority == TaskModel.lowPriority) {
      return SvgPicture.asset('assets/images/prefix_low_priority.svg');
    }

    return Container();
  }

  Widget _itemInfoButton(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {
              // TODO Open editor
              showCommonSnackbar(context, 'Open editor');
            },
            icon: SvgPicture.asset(
              'assets/images/info.svg',
              color: Theme.of(context).disabledColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemDeadline(BuildContext context) {
    final deadline = task.deadlineTime;

    if (deadline == null) return Container();
    final dateTime = DateTime.fromMillisecondsSinceEpoch(deadline);

    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        DateFormat('d MMMM yyyy').format(dateTime),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  Widget _itemTitle(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        task.title,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        softWrap: true,
        style: task.isDone
            ? Theme.of(context).textTheme.labelSmall
            : Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }

  Widget _itemCheckbox() {
    return _itemCheckboxIcon();
  }

  Widget _itemCheckboxIcon() {
    if (task.isDone) {
      return SvgPicture.asset('assets/images/checked.svg');
    }

    if (task.priority == TaskModel.importantPriority) {
      return SvgPicture.asset('assets/images/unchecked_important.svg');
    }

    return SvgPicture.asset('assets/images/unchecked.svg');
  }

  ActionPane _endActionPane(BuildContext context) {
    return ActionPane(
      dismissible: DismissiblePane(onDismissed: () {}),
      motion: const ScrollMotion(),
      children: [
        Expanded(
          child: Container(
            color: Theme.of(context).errorColor,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Icon(
                  Icons.delete,
                  color: Theme.of(context).cardColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  ActionPane? _startActionPane(BuildContext context) {
    if (task.isDone) return null;

    return ActionPane(
      dismissible: DismissiblePane(onDismissed: () {}),
      motion: const ScrollMotion(),
      children: [
        Expanded(
          child: Container(
            color: Theme.of(context).primaryColorLight,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Icon(
                  Icons.check,
                  color: Theme.of(context).cardColor,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
