import 'package:fpdart/fpdart.dart';
import 'package:hiddify/core/model/directories.dart';
import 'package:hiddify/singbox/model/running_process.dart';
import 'package:hiddify/singbox/model/singbox_config_option.dart';
import 'package:hiddify/singbox/model/singbox_outbound.dart';
import 'package:hiddify/singbox/model/singbox_stats.dart';
import 'package:hiddify/singbox/model/singbox_status.dart';
import 'package:hiddify/singbox/model/wireguard_keys.dart';
import 'package:hiddify/singbox/service/ffi_singbox_service.dart';

abstract interface class SingboxService {
  factory SingboxService() {
    // Windows only - use FFI service
    return FFISingboxService();
  }

  Future<void> init();

  /// setup directories and other initial platform services
  TaskEither<String, Unit> setup(
    Directories directories,
    bool debug,
  );

  /// validates config by path and save it
  ///
  /// [path] is used to save validated config
  /// [tempPath] includes base config, possibly invalid
  /// [debug] indicates if debug mode (avoid in prod)
  TaskEither<String, Unit> validateConfigByPath(
    String path,
    String tempPath,
    bool debug,
  );

  TaskEither<String, Unit> changeOptions(SingboxConfigOption options);

  /// generates full sing-box configuration
  ///
  /// [path] is the path to the base config file
  /// returns full patched json config file as string
  TaskEither<String, String> generateFullConfigByPath(String path);

  /// start sing-box service
  ///
  /// [path] is the path to the base config file (to be patched by previously set [SingboxConfigOption])
  /// [name] is the name of the active profile (not unique, used for presentation in platform specific ui)
  /// [disableMemoryLimit] is used to disable service memory limit (mostly used in mobile platforms i.e. iOS)
  TaskEither<String, Unit> start(
    String path,
    String name,
    bool disableMemoryLimit,
  );

  TaskEither<String, Unit> stop();

  /// similar to [start], but uses platform dependent behavior to restart the service
  TaskEither<String, Unit> restart(
    String path,
    String name,
    bool disableMemoryLimit,
  );

  TaskEither<String, Unit> resetTunnel();

  Stream<List<SingboxOutboundGroup>> watchGroups();

  Stream<List<SingboxOutboundGroup>> watchActiveGroups();

  TaskEither<String, Unit> selectOutbound(String groupTag, String outboundTag);

  TaskEither<String, Unit> urlTest(String groupTag);

  /// watch status of sing-box service (started, starting, etc.)
  Stream<SingboxStatus> watchStatus();

  /// watch stats of sing-box service (uplink, downlink, etc.)
  Stream<SingboxStats> watchStats();

  Stream<List<String>> watchLogs(String path);

  TaskEither<String, Unit> clearLogs();

  TaskEither<String, List<RunningProcess>> listRunningProcesses();

  /// Generate WireGuard key pairs for server and client
  TaskEither<String, WireGuardKeys> generateWireGuardKeys();

  /// Get local LAN IP address
  TaskEither<String, LanIPInfo> getLocalLanIP();

  // Xray integration methods

  /// Check if there are xray links stored (xhttp transport)
  bool hasXrayLinks();

  /// Get list of xray links
  TaskEither<String, XrayLinksInfo> getXrayLinks();

  /// Start Xray for specific link by index
  TaskEither<String, XrayStartResult> startXrayForLink(int linkIndex);

  /// Stop Xray service
  TaskEither<String, Unit> stopXray();

  /// Check if Xray is running
  bool isXrayRunning();

  /// Get Xray core info
  TaskEither<String, XrayCoreInfo> getXrayCoreInfo();

  /// Check if outbound tag is an xray proxy
  bool isXrayOutbound(String tag);

  /// Start Xray for outbound tag (if it's an xray proxy)
  /// Returns port if started, or indicates if it's not an xray outbound
  TaskEither<String, XrayByTagResult> startXrayByTag(String tag);

  /// Set Xray config from Hiddify Manager /xray endpoint
  /// This stores the full Xray JSON config for later use
  void setXrayConfig(String path, String content);

  /// Get stored Xray config path (if any)
  String? getXrayConfigPath();
}

/// Result of starting Xray by tag
class XrayByTagResult {
  final int port;
  final bool isXray;
  final String? error;

  XrayByTagResult({required this.port, required this.isXray, this.error});

  factory XrayByTagResult.fromJson(Map<String, dynamic> json) {
    return XrayByTagResult(
      port: json['port'] as int? ?? 0,
      isXray: json['is_xray'] as bool? ?? false,
      error: json['error'] as String?,
    );
  }
}

/// Info about stored xray links
class XrayLinksInfo {
  final List<String> links;
  final int count;

  XrayLinksInfo({required this.links, required this.count});

  factory XrayLinksInfo.fromJson(Map<String, dynamic> json) {
    return XrayLinksInfo(
      links: (json['links'] as List?)?.cast<String>() ?? [],
      count: json['count'] as int? ?? 0,
    );
  }
}

/// Result of starting Xray
class XrayStartResult {
  final int port;
  final String? error;

  XrayStartResult({required this.port, this.error});

  factory XrayStartResult.fromJson(Map<String, dynamic> json) {
    return XrayStartResult(
      port: json['port'] as int? ?? 0,
      error: json['error'] as String?,
    );
  }
}

/// Xray core info
class XrayCoreInfo {
  final bool running;
  final int port;
  final String type;

  XrayCoreInfo({required this.running, required this.port, required this.type});

  factory XrayCoreInfo.fromJson(Map<String, dynamic> json) {
    return XrayCoreInfo(
      running: json['running'] as bool? ?? false,
      port: json['port'] as int? ?? 0,
      type: json['type'] as String? ?? 'unknown',
    );
  }
}
