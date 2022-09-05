import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/utils/importance_enum.dart';

final importanceProvider =
    StateProvider.autoDispose.family<Importance, Importance?>(
  (ref, importance) => importance ?? Importance.basic,
);
