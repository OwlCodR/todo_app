import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/importance_enum.dart';

final importanceLocaleProvider =
    StateProvider.autoDispose.family<String, List<Object?>>((ref, list) {
  final appLocalizations = list[0] as AppLocalizations;
  final importance = list[1] as Importance;

  switch (importance) {
    case Importance.important:
      return appLocalizations.important;
    case Importance.basic:
      return appLocalizations.basic;
    case Importance.low:
      return appLocalizations.low;
  }
});
