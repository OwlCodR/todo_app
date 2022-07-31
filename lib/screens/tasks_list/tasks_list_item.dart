import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/models/task_element.dart';

class TasksListItem extends StatelessWidget {
  final TaskElement element;

  const TasksListItem({Key? key, required this.element}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Slidable(
        key: UniqueKey(),
        startActionPane: ActionPane(
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
            )
          ],
        ),
        endActionPane: ActionPane(
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
            )
          ],
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 48, maxHeight: 84),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: SvgPicture.asset('assets/images/unchecked.svg'),
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    element.title,
                    textScaleFactor: 1,
                    maxLines: 3,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(width: 12),
                Align(
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
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Open editor'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.info_outline,
                            color: Theme.of(context).disabledColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
