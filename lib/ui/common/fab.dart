import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'snackbar.dart';

class CommonFab extends StatelessWidget {
  const CommonFab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () =>
          showCommonSnackbar(context, AppLocalizations.of(context).goToEditor),
      child: Icon(
        Icons.add,
        color: Theme.of(context).cardColor,
      ),
    );
  }
}
