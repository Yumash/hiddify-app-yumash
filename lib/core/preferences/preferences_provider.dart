import 'dart:io';

import 'package:hiddify/core/directories/directories_provider.dart';
import 'package:hiddify/core/preferences/portable_preferences.dart';
import 'package:loggy/loggy.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'preferences_provider.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(Ref ref) async {
  final logger = Loggy("preferences");
  SharedPreferences? prefs;

  logger.debug("initializing preferences");
  try {
    // Use PortablePreferences which handles portable mode automatically
    prefs = await PortablePreferences.getInstance();
  } catch (e) {
    logger.error("error initializing preferences", e);
    // Fallback: try to recover from corrupted preferences
    final portableDir = getPortableDirectory();
    if (portableDir != null) {
      final file = File(p.join(portableDir.path, 'preferences.json'));
      if (file.existsSync()) {
        file.deleteSync();
      }
    }
    // Retry
    prefs = await PortablePreferences.getInstance();
  }

  return prefs;
}
