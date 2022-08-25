import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.title,
    required this.isDone,
  }) : super(key: key);

  final String title;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        softWrap: true,
        style: isDone
            ? Theme.of(context).textTheme.labelSmall
            : Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
