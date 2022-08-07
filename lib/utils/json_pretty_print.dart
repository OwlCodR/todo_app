import 'dart:convert';

String prettyString(dynamic object) {
  return const JsonEncoder.withIndent('  ').convert(object);
}
