import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/tasks_editor/editor_importance_provider.dart';

import '../../utils/importance_enum.dart';

final importanceLocaleProvider =
    StateProvider.autoDispose.family<String, BuildContext>((ref, context) {
  switch (ref.watch(importanceProvider)) {
    case Importance.important:
      return AppLocalizations.of(context).important;
    case Importance.basic:
      return AppLocalizations.of(context).basic;
    case Importance.low:
      return AppLocalizations.of(context).low;
  }
});
