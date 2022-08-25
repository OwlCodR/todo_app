import 'package:flutter/material.dart';

class StartActionPaneContent extends StatelessWidget {
  const StartActionPaneContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
