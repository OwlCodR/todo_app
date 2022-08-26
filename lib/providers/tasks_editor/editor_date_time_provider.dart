import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateTimeProvider = StateProvider.autoDispose((ref) => DateTime.now());
