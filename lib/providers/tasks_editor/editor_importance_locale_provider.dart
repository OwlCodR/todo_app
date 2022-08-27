import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/domain/importance_locale_args.dart';
import '../../utils/importance_enum.dart';

final importanceLocaleProvider =
    StateProvider.autoDispose.family<String, ImportanceLocaleArgs>((ref, args) {
  final appLocalizations = args.appLocalizations;

  switch (args.importance) {
    case Importance.important:
      return appLocalizations.important;
    case Importance.basic:
      return appLocalizations.basic;
    case Importance.low:
      return appLocalizations.low;
  }
});
