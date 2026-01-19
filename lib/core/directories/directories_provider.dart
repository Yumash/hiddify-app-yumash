import 'dart:io';

import 'package:hiddify/core/model/directories.dart';
import 'package:hiddify/utils/custom_loggers.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'directories_provider.g.dart';

/// Returns portable data directory next to executable (Windows only)
Directory? getPortableDirectory() {
  final exePath = Platform.resolvedExecutable;
  final exeDir = p.dirname(exePath);
  final portableDir = Directory(p.join(exeDir, 'portable_data'));

  // Check if portable mode is enabled (portable_data folder exists or .portable marker file)
  final markerFile = File(p.join(exeDir, '.portable'));
  if (portableDir.existsSync() || markerFile.existsSync()) {
    return portableDir;
  }

  // Auto-enable portable mode if running from non-standard location
  // (not in Program Files, WindowsApps, etc.)
  final isStandardInstall = exeDir.toLowerCase().contains('program files') ||
      exeDir.toLowerCase().contains('windowsapps');
  if (!isStandardInstall) {
    return portableDir;
  }

  return null;
}

@Riverpod(keepAlive: true)
class AppDirectories extends _$AppDirectories with InfraLogger {
  @override
  Future<Directories> build() async {
    final Directories dirs;
    // Check for portable mode on Windows
    final portableDir = getPortableDirectory();

    if (portableDir != null) {
      loggy.info("Running in PORTABLE mode: ${portableDir.path}");
      final tempDir = Directory(p.join(portableDir.path, 'temp'));
      dirs = (
        baseDir: portableDir,
        workingDir: portableDir,
        tempDir: tempDir,
      );
    } else {
      final baseDir = await getApplicationSupportDirectory();
      final tempDir = await getTemporaryDirectory();
      dirs = (
        baseDir: baseDir,
        workingDir: baseDir,
        tempDir: tempDir,
      );
    }

    if (!dirs.baseDir.existsSync()) {
      await dirs.baseDir.create(recursive: true);
    }
    if (!dirs.workingDir.existsSync()) {
      await dirs.workingDir.create(recursive: true);
    }

    return dirs;
  }

  static Future<Directory> getDatabaseDirectory() async {
    // Check for portable mode on Windows
    final portableDir = getPortableDirectory();
    if (portableDir != null) {
      return portableDir;
    }
    return getApplicationSupportDirectory();
  }
}
