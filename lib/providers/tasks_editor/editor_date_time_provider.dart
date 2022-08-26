import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateTimeProvider =
    StateProvider.autoDispose.family<DateTime, int?>((ref, epochTime) {
  if (epochTime != null) {
    return DateTime.fromMillisecondsSinceEpoch(epochTime);
  }
  return DateTime.now();
});
