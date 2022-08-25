import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:uuid/uuid.dart';

import '../utils/logger.dart';

final _deviceIdFutureProvider = FutureProvider((ref) {
  return PlatformDeviceId.getDeviceId;
});

final deviceIdProvider = Provider((ref) {
  final asyncDeviceId = ref.watch(_deviceIdFutureProvider);
  String deviceId = const Uuid().v4();

  asyncDeviceId.when(
    loading: () => log.d('[tasksListProvider] Loading deviceId...'),
    data: (data) => deviceId = data ?? deviceId,
    error: (error, stack) =>
        log.e('[tasksListProvider] Failed to load deviceId: $error'),
  );

  return deviceId;
});
