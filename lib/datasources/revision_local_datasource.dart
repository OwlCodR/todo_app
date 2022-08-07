import 'package:shared_preferences/shared_preferences.dart';

import '../utils/logger.dart';

class RevisionLocalDatasource {
  static RevisionLocalDatasource? _instance;
  static const revisionKey = 'REVISION_KEY';

  RevisionLocalDatasource._constructor();
  static RevisionLocalDatasource getInstance() {
    // Making it Singleton
    _instance ??= RevisionLocalDatasource._constructor();
    return _instance!;
  }

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
