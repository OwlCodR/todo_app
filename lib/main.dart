import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';
import 'package:logger/logger.dart';
import 'package:shake/shake.dart';
import 'package:todo_app/providers/is_dark_mode_provider.dart';
import 'package:todo_app/ui/tasks_list/tasks_screen.dart';

import 'datasources/tasks_local_datasource.dart';
import 'firebase_options.dart';
import 'models/data/local/task_hive.dart';
import 'themes/themes.dart';
import 'utils/logger.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    Logger.level = loggerLevel;
    Intl.systemLocale = await findSystemLocale();
    await dotenv.load();
    await initHive();

    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

    runApp(const ProviderScope(child: MyApp()));
  },
      (error, stack) =>
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskHiveAdapter());
  await Hive.openBox<TaskHive>(TasksLocalDatasource.tasksAppBox);
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    ShakeDetector.autoStart(
      minimumShakeCount: 1,
      shakeSlopTimeMS: 3000,
      onPhoneShake: () {
        ref.read(isDarkModeProvider.notifier).update((state) => !state);
        HapticFeedback.mediumImpact();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context).appName,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode:
          ref.watch(isDarkModeProvider) ? ThemeMode.dark : ThemeMode.light,
      home: const TasksScreen(),
    );
  }
}
