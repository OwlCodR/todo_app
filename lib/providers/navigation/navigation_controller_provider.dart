import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/controllers/navigation_controller.dart';

import '../scaffold_messenger_key_provider.dart';
import 'router_delegate_provider.dart';

final navigationControllerProvider = Provider(
  (ref) => NavigationController(
    routerDelegate: ref.watch(routerDelegateProvider),
    scaffoldMessengerState:
        ref.watch(scaffoldMessengerKeyProvider).currentState!,
  ),
);
