import 'package:shared_preferences/shared_preferences.dart';

import '../utils/logger.dart';

class RevisionLocalDatasource {
  static const revisionKey = 'REVISION_KEY';

  Future<void> setRevision(int revision) async {
    log.d('[RevisionLocalDatasource] setRevision($revision)');
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(revisionKey, revision);
  }

  Future<int> getRevision() async {
    final prefs = await SharedPreferences.getInstance();
    final revision = prefs.getInt(revisionKey) ?? 0;
    log.d('[RevisionLocalDatasource] getRevision() = $revision');
    return revision;
  }
}
