import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../utils/importance_enum.dart';

class ImportanceLocaleArgs {
  ImportanceLocaleArgs({
    required this.appLocalizations,
    required this.importance,
  });

  final AppLocalizations appLocalizations;
  final Importance importance;
}
