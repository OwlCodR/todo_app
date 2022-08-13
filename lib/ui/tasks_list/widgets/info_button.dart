import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/constants/app_paths.dart';

import '../../common/snackbar.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      onPressed: () {
        // TODO Open editor
        showCommonSnackbar(context, AppLocalizations.of(context).goToEditor);
      },
      icon: SvgPicture.asset(
        AppPaths.info,
        color: Theme.of(context).disabledColor,
      ),
    );
  }
}
