import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/task_element.dart';
import '../../common/snackbar.dart';

class TasksListItem extends StatelessWidget {
  const TasksListItem({Key? key, required this.element}) : super(key: key);

  final TaskElement element;

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
            constraints: const BoxConstraints(minHeight: 48, maxHeight: 84),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                children: [
                  _itemSelectionIcon(),
                  const SizedBox(width: 12),
                  _itemTitle(context),
                  const SizedBox(width: 12),
                  _itemInfoButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemInfoButton(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ClipOval(
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
              icon: Icon(
                Icons.info_outline,
                color: Theme.of(context).disabledColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemTitle(BuildContext context) {
    return Flexible(
      child: Text(
        element.title,
        overflow: TextOverflow.ellipsis,
        textScaleFactor: 1,
        maxLines: 3,
        softWrap: true,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }

  Widget _itemSelectionIcon() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: SvgPicture.asset('assets/images/unchecked.svg'),
      ),
    );
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

  ActionPane _startActionPane(BuildContext context) {
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
