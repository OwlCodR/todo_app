import 'package:flutter_riverpod/flutter_riverpod.dart';

final editorTitleProvider =
    StateProvider.family<String, String?>((ref, title) => title ?? '');
