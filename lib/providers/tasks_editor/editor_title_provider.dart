import 'package:flutter_riverpod/flutter_riverpod.dart';

final editorTitleProvider = StateProvider.autoDispose
    .family<String, String?>((ref, title) => title ?? '');
