import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';
import 'package:logger/logger.dart';
import 'package:shake/shake.dart';
import 'package:todo_app/constants/app_config.dart';
import 'package:todo_app/constants/app_paths.dart';
import 'package:todo_app/providers/is_dark_mode_provider.dart';
import 'package:todo_app/providers/theme/dark_colors_provider.dart';
import 'package:todo_app/providers/theme/light_colors_provider.dart';
import 'package:todo_app/ui/tasks_list/tasks_screen.dart';

import 'datasources/tasks_local_datasource.dart';
import 'firebase_options.dart';
import 'models/data/local/task_hive.dart';
import 'providers/theme/dark_theme_provider.dart';
import 'providers/theme/light_theme_provider.dart';
import 'utils/logger.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    Logger.level = loggerLevel;
    Intl.systemLocale = await findSystemLocale();
    await dotenv.load();
    await initHive();
    await initSvgPitcures();

    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    await initRemoteConfigSettings();

    runApp(const ProviderScope(child: MyApp()));
  },
      (error, stack) =>
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
}

Future<void> initSvgPitcures() {
  return Future.wait([
    for (final appPath in AppPaths.values)
      precachePicture(
        ExactAssetPicture(
          SvgPicture.svgStringDecoderBuilder,
          appPath.path,
        ),
        null,
      )
  ]);
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskHiveAdapter());
  await Hive.openBox<TaskHive>(TasksLocalDatasource.tasksAppBox);
}

Future<void> initRemoteConfigSettings() {
  return FirebaseRemoteConfig.instance.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: Duration.zero,
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  Future<void> initDefaultRemoteConfig() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetchAndActivate();

    final importanceColor = Color(
      int.parse(
        remoteConfig.getString(AppConfig.importanceColor),
      ),
    );

    log.d(
        'Loaded ${remoteConfig.getString(AppConfig.importanceColor)} status: ${remoteConfig.lastFetchStatus}');
    log.d('Loaded $importanceColor status: ${remoteConfig.lastFetchStatus}');
    ref
        .read(darkColorsProvider.notifier)
        .update((state) => state.copyWith(red: importanceColor));
    ref
        .read(lightColorsProvider.notifier)
        .update((state) => state.copyWith(red: importanceColor));
  }

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

    initDefaultRemoteConfig();

    FirebaseAnalytics.instance.logAppOpen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context).appName,
      theme: ref.watch(lightThemeProvider),
      darkTheme: ref.watch(darkThemeProvider),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode:
          ref.watch(isDarkModeProvider) ? ThemeMode.dark : ThemeMode.light,
      home: const TasksScreen(),
    );
  }
}
