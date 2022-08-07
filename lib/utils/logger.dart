import 'package:logger/logger.dart';

const loggerLevel = Level.verbose;

final Logger log = Logger(
  printer: PrettyPrinter(
    noBoxingByDefault: true,
    methodCount: 0,
  ),
);
