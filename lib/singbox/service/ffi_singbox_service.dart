import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:isolate';
import 'package:ffi/ffi.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hiddify/core/model/directories.dart';
import 'package:hiddify/gen/singbox_generated_bindings.dart';
import 'package:hiddify/singbox/model/running_process.dart';
import 'package:hiddify/singbox/model/singbox_config_option.dart';
import 'package:hiddify/singbox/model/singbox_outbound.dart';
import 'package:hiddify/singbox/model/singbox_stats.dart';
import 'package:hiddify/singbox/model/singbox_status.dart';
import 'package:hiddify/singbox/model/wireguard_keys.dart';
import 'package:hiddify/singbox/service/singbox_service.dart';
import 'package:hiddify/utils/utils.dart';
import 'package:loggy/loggy.dart';
import 'package:path/path.dart' as p;
import 'package:rxdart/rxdart.dart';
import 'package:watcher/watcher.dart';

final _logger = Loggy('FFISingboxService');

class FFISingboxService with InfraLogger implements SingboxService {
  static final SingboxNativeLibrary _box = _gen();

  late final ValueStream<SingboxStatus> _status;
  late final ReceivePort _statusReceiver;
  Stream<SingboxStats>? _serviceStatsStream;
  Stream<List<SingboxOutboundGroup>>? _outboundsStream;

  static SingboxNativeLibrary _gen() {
    // Windows only - load libcore.dll
    String fullPath = "";
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      fullPath = "libcore";
    }
    fullPath = p.join(fullPath, "libcore.dll");
    _logger.debug('singbox native libs path: "$fullPath"');
    final lib = DynamicLibrary.open(fullPath);
    return SingboxNativeLibrary(lib);
  }

  @override
  Future<void> init() async {
    loggy.debug("initializing");
    _statusReceiver = ReceivePort('service status receiver');
    final source = _statusReceiver.asBroadcastStream().map((event) => jsonDecode(event as String)).map(SingboxStatus.fromEvent);
    _status = ValueConnectableStream.seeded(
      source,
      const SingboxStopped(),
    ).autoConnect();
  }

  @override
  TaskEither<String, Unit> setup(
    Directories directories,
    bool debug,
  ) {
    final port = _statusReceiver.sendPort.nativePort;
    return TaskEither(
      () async {
        _box.setupOnce(NativeApi.initializeApiDLData);
        final err = _box
            .setup(
              directories.baseDir.path.toNativeUtf8().cast(),
              directories.workingDir.path.toNativeUtf8().cast(),
              directories.tempDir.path.toNativeUtf8().cast(),
              port,
              debug ? 1 : 0,
            )
            .cast<Utf8>()
            .toDartString();
        if (err.isNotEmpty) {
          return left(err);
        }
        return right(unit);
      },
    );
  }

  @override
  TaskEither<String, Unit> validateConfigByPath(
    String path,
    String tempPath,
    bool debug,
  ) {
    return TaskEither(
      () async {
        final err = _box
            .parse(
              path.toNativeUtf8().cast(),
              tempPath.toNativeUtf8().cast(),
              debug ? 1 : 0,
            )
            .cast<Utf8>()
            .toDartString();
        if (err.isNotEmpty) {
          return left(err);
        }
        return right(unit);
      },
    );
  }

  @override
  TaskEither<String, Unit> changeOptions(SingboxConfigOption options) {
    return TaskEither(
      () async {
        final json = jsonEncode(options.toJson());
        final err = _box.changeHiddifyOptions(json.toNativeUtf8().cast()).cast<Utf8>().toDartString();
        if (err.isNotEmpty) {
          return left(err);
        }
        return right(unit);
      },
    );
  }

  @override
  TaskEither<String, String> generateFullConfigByPath(
    String path,
  ) {
    return TaskEither(
      () async {
        final response = _box
            .generateConfig(
              path.toNativeUtf8().cast(),
            )
            .cast<Utf8>()
            .toDartString();
        if (response.startsWith("error")) {
          return left(response.replaceFirst("error", ""));
        }
        return right(response);
      },
    );
  }

  @override
  TaskEither<String, Unit> start(
    String configPath,
    String name,
    bool disableMemoryLimit,
  ) {
    loggy.debug("starting, memory limit: [${!disableMemoryLimit}]");
    return TaskEither(
      () async {
        final err = _box
            .start(
              configPath.toNativeUtf8().cast(),
              disableMemoryLimit ? 1 : 0,
            )
            .cast<Utf8>()
            .toDartString();
        if (err.isNotEmpty) {
          return left(err);
        }
        return right(unit);
      },
    );
  }

  @override
  TaskEither<String, Unit> stop() {
    return TaskEither(
      () async {
        // Clean up streams to prevent memory leaks
        _cleanupStreams();

        final err = _box.stop().cast<Utf8>().toDartString();
        if (err.isNotEmpty) {
          return left(err);
        }
        return right(unit);
      },
    );
  }

  /// Clean up cached broadcast streams to release resources
  void _cleanupStreams() {
    if (_serviceStatsStream != null) {
      _logger.debug("cleaning up stats stream");
      // Stop the command client for stats (command type 1)
      _box.stopCommandClient(1).cast<Utf8>().toDartString();
      _serviceStatsStream = null;
    }
    if (_outboundsStream != null) {
      _logger.debug("cleaning up outbounds stream");
      // Stop the command client for groups (command type 5)
      _box.stopCommandClient(5).cast<Utf8>().toDartString();
      _outboundsStream = null;
    }
  }

  @override
  TaskEither<String, Unit> restart(
    String configPath,
    String name,
    bool disableMemoryLimit,
  ) {
    loggy.debug("restarting, memory limit: [${!disableMemoryLimit}]");
    return TaskEither(
      () async {
        final err = _box
            .restart(
              configPath.toNativeUtf8().cast(),
              disableMemoryLimit ? 1 : 0,
            )
            .cast<Utf8>()
            .toDartString();
        if (err.isNotEmpty) {
          return left(err);
        }
        return right(unit);
      },
    );
  }

  @override
  TaskEither<String, Unit> resetTunnel() {
    throw UnimplementedError(
      "reset tunnel function unavailable on platform",
    );
  }

  @override
  Stream<SingboxStatus> watchStatus() => _status;

  @override
  Stream<SingboxStats> watchStats() {
    if (_serviceStatsStream != null) return _serviceStatsStream!;
    final receiver = ReceivePort('stats');
    final statusStream = receiver.asBroadcastStream(
      onCancel: (_) {
        _logger.debug("stopping stats command client");
        final err = _box.stopCommandClient(1).cast<Utf8>().toDartString();
        if (err.isNotEmpty) {
          _logger.error("error stopping stats client");
        }
        receiver.close();
        _serviceStatsStream = null;
      },
    ).map(
      (event) {
        if (event case String _) {
          if (event.startsWith('error:')) {
            loggy.error("[service stats client] error received: $event");
            throw event.replaceFirst('error:', "");
          }
          return SingboxStats.fromJson(
            jsonDecode(event) as Map<String, dynamic>,
          );
        }
        loggy.error("[service status client] unexpected type, msg: $event");
        throw "invalid type";
      },
    );

    final err = _box.startCommandClient(1, receiver.sendPort.nativePort).cast<Utf8>().toDartString();
    if (err.isNotEmpty) {
      loggy.error("error starting status command: $err");
      throw err;
    }

    return _serviceStatsStream = statusStream;
  }

  @override
  Stream<List<SingboxOutboundGroup>> watchGroups() {
    final logger = newLoggy("watchGroups");
    if (_outboundsStream != null) return _outboundsStream!;
    final receiver = ReceivePort('groups');
    final outboundsStream = receiver.asBroadcastStream(
      onCancel: (_) {
        logger.debug("stopping");
        receiver.close();
        _outboundsStream = null;
        final err = _box.stopCommandClient(5).cast<Utf8>().toDartString();
        if (err.isNotEmpty) {
          _logger.error("error stopping group client");
        }
      },
    ).map(
      (event) {
        if (event case String _) {
          if (event.startsWith('error:')) {
            logger.error("error received: $event");
            throw event.replaceFirst('error:', "");
          }

          return (jsonDecode(event) as List).map((e) {
            return SingboxOutboundGroup.fromJson(e as Map<String, dynamic>);
          }).toList();
        }
        logger.error("unexpected type, msg: $event");
        throw "invalid type";
      },
    );

    try {
      final err = _box.startCommandClient(5, receiver.sendPort.nativePort).cast<Utf8>().toDartString();
      if (err.isNotEmpty) {
        logger.error("error starting group command: $err");
        throw err;
      }
    } catch (e) {
      receiver.close();
      rethrow;
    }

    return _outboundsStream = outboundsStream;
  }

  @override
  Stream<List<SingboxOutboundGroup>> watchActiveGroups() {
    final logger = newLoggy("[ActiveGroupsClient]");
    final receiver = ReceivePort('active groups');
    final outboundsStream = receiver.asBroadcastStream(
      onCancel: (_) {
        logger.debug("stopping");
        receiver.close();
        final err = _box.stopCommandClient(13).cast<Utf8>().toDartString();
        if (err.isNotEmpty) {
          logger.error("failed stopping: $err");
        }
      },
    ).map(
      (event) {
        if (event case String _) {
          if (event.startsWith('error:')) {
            logger.error(event);
            throw event.replaceFirst('error:', "");
          }

          return (jsonDecode(event) as List).map((e) {
            return SingboxOutboundGroup.fromJson(e as Map<String, dynamic>);
          }).toList();
        }
        logger.error("unexpected type, msg: $event");
        throw "invalid type";
      },
    );

    try {
      final err = _box.startCommandClient(13, receiver.sendPort.nativePort).cast<Utf8>().toDartString();
      if (err.isNotEmpty) {
        logger.error("error starting: $err");
        throw err;
      }
    } catch (e) {
      receiver.close();
      rethrow;
    }

    return outboundsStream;
  }

  @override
  TaskEither<String, Unit> selectOutbound(String groupTag, String outboundTag) {
    return TaskEither(
      () async {
        final err = _box
            .selectOutbound(
              groupTag.toNativeUtf8().cast(),
              outboundTag.toNativeUtf8().cast(),
            )
            .cast<Utf8>()
            .toDartString();
        if (err.isNotEmpty) {
          return left(err);
        }
        return right(unit);
      },
    );
  }

  @override
  TaskEither<String, Unit> urlTest(String groupTag) {
    return TaskEither(
      () async {
        final err = _box.urlTest(groupTag.toNativeUtf8().cast()).cast<Utf8>().toDartString();
        if (err.isNotEmpty) {
          return left(err);
        }
        return right(unit);
      },
    );
  }

  final _logBuffer = <String>[];
  int _logFilePosition = 0;

  @override
  Stream<List<String>> watchLogs(String path) async* {
    final file = File(path);
    // Ensure log file exists (create empty if not)
    if (!await file.exists()) {
      await file.create(recursive: true);
    }
    yield await _readLogFile(file);
    yield* Watcher(path, pollingDelay: const Duration(seconds: 1)).events.asyncMap((event) async {
      if (event.type == ChangeType.MODIFY) {
        await _readLogFile(file);
      }
      return _logBuffer;
    });
  }

  @override
  TaskEither<String, Unit> clearLogs() {
    return TaskEither(
      () async {
        _logBuffer.clear();
        return right(unit);
      },
    );
  }

  Future<List<String>> _readLogFile(File file) async {
    if (_logFilePosition == 0 && file.lengthSync() == 0) return [];
    final content = await file.openRead(_logFilePosition).transform(utf8.decoder).join();
    _logFilePosition = file.lengthSync();
    final lines = const LineSplitter().convert(content);
    if (lines.length > 300) {
      lines.removeRange(0, lines.length - 300);
    }
    for (final line in lines) {
      _logBuffer.add(line);
      if (_logBuffer.length > 300) {
        _logBuffer.removeAt(0);
      }
    }
    return _logBuffer;
  }

  @override
  TaskEither<String, List<RunningProcess>> listRunningProcesses() {
    return TaskEither(
      () async {
        final response = _box.listRunningProcesses().cast<Utf8>().toDartString();
        final json = jsonDecode(response);
        if (json is Map && json.containsKey('error')) {
          return left(json['error'] as String);
        }
        final processes = (json as List)
            .map((e) => RunningProcess.fromJson(e as Map<String, dynamic>))
            .toList();
        return right(processes);
      },
    );
  }

  @override
  TaskEither<String, WireGuardKeys> generateWireGuardKeys() {
    return TaskEither(
      () async {
        final response = _box.generateWireGuardKeys().cast<Utf8>().toDartString();
        final json = jsonDecode(response) as Map<String, dynamic>;
        if (json.containsKey('error') && json['error'] != null && (json['error'] as String).isNotEmpty) {
          return left(json['error'] as String);
        }
        return right(WireGuardKeys.fromJson(json));
      },
    );
  }

  @override
  TaskEither<String, LanIPInfo> getLocalLanIP() {
    return TaskEither(
      () async {
        final response = _box.getLocalLanIP().cast<Utf8>().toDartString();
        final json = jsonDecode(response) as Map<String, dynamic>;
        if (json.containsKey('error') && json['error'] != null && (json['error'] as String).isNotEmpty) {
          return left(json['error'] as String);
        }
        return right(LanIPInfo.fromJson(json));
      },
    );
  }

  // Xray integration methods

  @override
  bool hasXrayLinks() {
    try {
      return _box.hasXrayLinks();
    } catch (e) {
      _logger.error('hasXrayLinks error: $e');
      return false;
    }
  }

  @override
  TaskEither<String, XrayLinksInfo> getXrayLinks() {
    return TaskEither(
      () async {
        final response = _box.getXrayLinks().cast<Utf8>().toDartString();
        final json = jsonDecode(response) as Map<String, dynamic>;
        if (json.containsKey('error') && json['error'] != null && (json['error'] as String).isNotEmpty) {
          return left(json['error'] as String);
        }
        return right(XrayLinksInfo.fromJson(json));
      },
    );
  }

  @override
  TaskEither<String, XrayStartResult> startXrayForLink(int linkIndex) {
    return TaskEither(
      () async {
        final response = _box.startXrayForLink(linkIndex).cast<Utf8>().toDartString();
        final json = jsonDecode(response) as Map<String, dynamic>;
        if (json.containsKey('error') && json['error'] != null && (json['error'] as String).isNotEmpty) {
          return left(json['error'] as String);
        }
        return right(XrayStartResult.fromJson(json));
      },
    );
  }

  @override
  TaskEither<String, Unit> stopXray() {
    return TaskEither(
      () async {
        final err = _box.stopXray().cast<Utf8>().toDartString();
        if (err.isNotEmpty) {
          return left(err);
        }
        return right(unit);
      },
    );
  }

  @override
  bool isXrayRunning() {
    try {
      return _box.isXrayRunning();
    } catch (e) {
      _logger.error('isXrayRunning error: $e');
      return false;
    }
  }

  @override
  TaskEither<String, XrayCoreInfo> getXrayCoreInfo() {
    return TaskEither(
      () async {
        final response = _box.getXrayCoreInfo().cast<Utf8>().toDartString();
        final json = jsonDecode(response) as Map<String, dynamic>;
        if (json.containsKey('error') && json['error'] != null && (json['error'] as String).isNotEmpty) {
          return left(json['error'] as String);
        }
        return right(XrayCoreInfo.fromJson(json));
      },
    );
  }

  @override
  bool isXrayOutbound(String tag) {
    try {
      return _box.isXrayOutbound(tag.toNativeUtf8().cast());
    } catch (e) {
      _logger.error('isXrayOutbound error: $e');
      return false;
    }
  }

  @override
  TaskEither<String, XrayByTagResult> startXrayByTag(String tag) {
    return TaskEither(
      () async {
        final response = _box.startXrayByTag(tag.toNativeUtf8().cast()).cast<Utf8>().toDartString();
        final json = jsonDecode(response) as Map<String, dynamic>;
        if (json.containsKey('error') && json['error'] != null && (json['error'] as String).isNotEmpty) {
          return left(json['error'] as String);
        }
        return right(XrayByTagResult.fromJson(json));
      },
    );
  }

  // Xray config storage for Hiddify Manager subscriptions
  String? _xrayConfigPath;
  String? _xrayConfigContent;

  @override
  void setXrayConfig(String path, String content) {
    _xrayConfigPath = path;
    _xrayConfigContent = content;
    _logger.debug('Stored Xray config: $path (${content.length} bytes)');

    // Also pass to native code for xray core to use
    try {
      final err = _box
          .setXrayConfigJson(content.toNativeUtf8().cast())
          .cast<Utf8>()
          .toDartString();
      if (err.isNotEmpty) {
        _logger.warning('setXrayConfigJson error: $err');
      }
    } catch (e) {
      _logger.warning('setXrayConfigJson exception: $e');
    }
  }

  @override
  String? getXrayConfigPath() => _xrayConfigPath;
}
