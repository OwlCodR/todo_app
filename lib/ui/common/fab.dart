import 'package:flutter/material.dart';

import 'snackbar.dart';

class CommonFab extends StatelessWidget {
  const CommonFab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showCommonSnackbar(context, 'Go to editor screen');
      },
      child: Icon(
        Icons.add,
        color: Theme.of(context).cardColor,
      ),
    );
  }
}
