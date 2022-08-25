import 'package:flutter/material.dart';

class EndActionPaneContent extends StatelessWidget {
  const EndActionPaneContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
