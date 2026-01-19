import 'dart:io';

import 'package:path/path.dart' as p;

class ProfilePathResolver {
  const ProfilePathResolver(this._workingDir);

  final Directory _workingDir;

  Directory get directory => Directory(p.join(_workingDir.path, "configs"));

  /// Debug directory for saving raw responses
  Directory get debugDirectory => Directory(p.join(_workingDir.path, "debug"));

  /// Main sing-box config file
  File file(String fileName) {
    return File(p.join(directory.path, "$fileName.json"));
  }

  File tempFile(String fileName) => file("$fileName.tmp");

  /// Xray config file (for Hiddify Manager subscriptions)
  File xrayFile(String fileName) {
    return File(p.join(directory.path, "$fileName.xray.json"));
  }

  File xrayTempFile(String fileName) => xrayFile("$fileName.tmp");

  /// Debug file for raw response
  File debugFile(String name) {
    return File(p.join(debugDirectory.path, name));
  }
}
