import 'package:flutter_riverpod/flutter_riverpod.dart';

final switchStateProvider = StateProvider.autoDispose
    .family<bool, bool?>((ref, isSwitched) => isSwitched ?? false);
