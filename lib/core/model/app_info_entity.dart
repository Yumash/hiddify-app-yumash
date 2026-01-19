import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiddify/core/model/environment.dart';

part 'app_info_entity.freezed.dart';

/// Reads yumash version from yaml file next to executable
/// Format: hiddify_base-yumash-yumash_version (e.g., 2.5.7-yumash-1.0.0)
({String hiddifyBase, String yumashVersion}) _readYumashVersion() {
  try {
    final exePath = Platform.resolvedExecutable;
    final exeDir = File(exePath).parent.path;
    final versionFile = File('$exeDir/version.yaml');
    if (versionFile.existsSync()) {
      final content = versionFile.readAsStringSync();
      String? hiddifyBase;
      String? yumashVersion;
      for (final line in content.split('\n')) {
        final trimmed = line.trim();
        if (trimmed.startsWith('hiddify_base:')) {
          hiddifyBase = trimmed.split(':').last.trim().replaceAll('"', '');
        } else if (trimmed.startsWith('yumash_version:')) {
          yumashVersion = trimmed.split(':').last.trim().replaceAll('"', '');
        }
      }
      if (hiddifyBase != null && yumashVersion != null) {
        return (hiddifyBase: hiddifyBase, yumashVersion: yumashVersion);
      }
    }
  } catch (e) {
    if (kDebugMode) debugPrint('_readYumashVersion: Failed to read version.yaml: $e');
  }
  return (hiddifyBase: '2.5.7', yumashVersion: '1.0.0');
}

final _yumashVersion = _readYumashVersion();

@freezed
abstract class AppInfoEntity with _$AppInfoEntity {
  const AppInfoEntity._();

  const factory AppInfoEntity({
    required String name,
    required String version,
    required String buildNumber,
    required Release release,
    required String operatingSystem,
    required String operatingSystemVersion,
    required Environment environment,
  }) = _AppInfoEntity;

  String get userAgent =>
      "HiddifyNext/$version ($operatingSystem) like ClashMeta v2ray sing-box";

  /// Full version string: hiddify_base-yumash-yumash_version
  String get presentVersion =>
      "${_yumashVersion.hiddifyBase}-yumash-${_yumashVersion.yumashVersion}";

  /// formats app info for sharing
  String format() => '''
$name v$presentVersion ($buildNumber) [${environment.name}]
${release.name} release
$operatingSystem [$operatingSystemVersion]''';
}
