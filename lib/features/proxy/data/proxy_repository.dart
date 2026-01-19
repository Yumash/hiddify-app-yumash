import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hiddify/core/http_client/dio_http_client.dart';
import 'package:hiddify/core/utils/exception_handler.dart';
import 'package:hiddify/features/proxy/model/ip_info_entity.dart';
import 'package:hiddify/features/proxy/model/proxy_entity.dart';
import 'package:hiddify/features/proxy/model/proxy_failure.dart';
import 'package:hiddify/singbox/model/singbox_proxy_type.dart';
import 'package:hiddify/singbox/service/singbox_service.dart';
import 'package:hiddify/utils/custom_loggers.dart';

abstract interface class ProxyRepository {
  Stream<Either<ProxyFailure, List<ProxyGroupEntity>>> watchProxies();
  Stream<Either<ProxyFailure, List<ProxyGroupEntity>>> watchActiveProxies();
  TaskEither<ProxyFailure, IpInfo> getCurrentIpInfo(CancelToken cancelToken);
  TaskEither<ProxyFailure, Unit> selectProxy(
    String groupTag,
    String outboundTag,
  );
  TaskEither<ProxyFailure, Unit> urlTest(String groupTag);

  /// Read proxies from profile config file (works without VPN connection)
  TaskEither<ProxyFailure, List<ProxyGroupEntity>> getProxiesFromFile(String configPath);
}

class ProxyRepositoryImpl with ExceptionHandler, InfraLogger implements ProxyRepository {
  ProxyRepositoryImpl({
    required this.singbox,
    required this.client,
  });

  final SingboxService singbox;
  final DioHttpClient client;

  @override
  Stream<Either<ProxyFailure, List<ProxyGroupEntity>>> watchProxies() {
    return singbox.watchGroups().map((event) {
      final groupWithSelected = {
        for (final group in event) group.tag: group.selected,
      };
      return event
          .map(
            (e) => ProxyGroupEntity(
              tag: e.tag,
              type: e.type,
              selected: e.selected,
              items: e.items
                  .map(
                    (e) => ProxyItemEntity(
                      tag: e.tag,
                      type: e.type,
                      urlTestDelay: e.urlTestDelay,
                      selectedTag: groupWithSelected[e.tag],
                    ),
                  )
                  .filter((t) => t.isVisible)
                  .toList(),
            ),
          )
          .toList();
    }).handleExceptions(
      (error, stackTrace) {
        loggy.error("error watching proxies", error, stackTrace);
        return ProxyUnexpectedFailure(error, stackTrace);
      },
    );
  }

  @override
  Stream<Either<ProxyFailure, List<ProxyGroupEntity>>> watchActiveProxies() {
    return singbox.watchActiveGroups().map((event) {
      final groupWithSelected = {
        for (final group in event) group.tag: group.selected,
      };
      return event
          .map(
            (e) => ProxyGroupEntity(
              tag: e.tag,
              type: e.type,
              selected: e.selected,
              items: e.items
                  .map(
                    (e) => ProxyItemEntity(
                      tag: e.tag,
                      type: e.type,
                      urlTestDelay: e.urlTestDelay,
                      selectedTag: groupWithSelected[e.tag],
                    ),
                  )
                  .toList(),
            ),
          )
          .toList();
    }).handleExceptions(
      (error, stackTrace) {
        loggy.error("error watching active proxies", error, stackTrace);
        return ProxyUnexpectedFailure(error, stackTrace);
      },
    );
  }

  @override
  TaskEither<ProxyFailure, Unit> selectProxy(
    String groupTag,
    String outboundTag,
  ) {
    return exceptionHandler(
      () async {
        // Check if this is an xray outbound and start Xray if needed
        if (singbox.isXrayOutbound(outboundTag)) {
          loggy.info("Selected xray proxy: $outboundTag, starting Xray...");
          final xrayResult = await singbox.startXrayByTag(outboundTag).run();

          // CRITICAL: If Xray fails to start, return error - don't continue
          // Otherwise sing-box will point to dead SOCKS port
          final xrayError = xrayResult.fold<String?>(
            (error) => "Failed to start Xray: $error",
            (result) {
              if (result.error != null) {
                return "Xray start error: ${result.error}";
              }
              if (result.isXray) {
                loggy.info("Xray started successfully on port ${result.port}");
              }
              return null; // Success
            },
          );

          if (xrayError != null) {
            loggy.error(xrayError);
            return left(ProxyUnexpectedFailure(xrayError, StackTrace.current));
          }
        } else {
          // Stop Xray if we're switching to a non-xray proxy
          if (singbox.isXrayRunning()) {
            loggy.info("Switching to non-xray proxy, stopping Xray...");
            final stopResult = await singbox.stopXray().run();
            stopResult.fold(
              (error) => loggy.warning("Failed to stop Xray: $error"),
              (_) => loggy.info("Xray stopped"),
            );
          }
        }

        // Select the outbound in sing-box
        return singbox.selectOutbound(groupTag, outboundTag).mapLeft(ProxyUnexpectedFailure.new).run();
      },
      ProxyUnexpectedFailure.new,
    );
  }

  @override
  TaskEither<ProxyFailure, Unit> urlTest(String groupTag_) {
    var groupTag = groupTag_;
    loggy.debug("testing group: [$groupTag]");
    if (!["auto"].contains(groupTag)) {
      loggy.warning("only auto proxy group can do url test. Please change go code if you want");
    }
    groupTag = "auto";

    return exceptionHandler(
      () => singbox.urlTest(groupTag).mapLeft(ProxyUnexpectedFailure.new).run(),
      ProxyUnexpectedFailure.new,
    );
  }

  static final Map<String, IpInfo Function(Map<String, dynamic> response)> _ipInfoSources = {
    // "https://geolocation-db.com/json/": IpInfo.fromGeolocationDbComJson, //bug response is not json
    "https://ipwho.is/": IpInfo.fromIpwhoIsJson,
    "https://api.ip.sb/geoip/": IpInfo.fromIpSbJson,
    "https://ipapi.co/json/": IpInfo.fromIpApiCoJson,
    "https://ipinfo.io/json/": IpInfo.fromIpInfoIoJson,
  };

  @override
  TaskEither<ProxyFailure, IpInfo> getCurrentIpInfo(CancelToken cancelToken) {
    return TaskEither.tryCatch(
      () async {
        Object? error;
        for (final source in _ipInfoSources.entries) {
          try {
            loggy.debug("getting current ip info using [${source.key}]");
            final response = await client.get<Map<String, dynamic>>(
              source.key,
              cancelToken: cancelToken,
              proxyOnly: true,
            );
            if (response.statusCode == 200 && response.data != null) {
              return source.value(response.data!);
            }
          } catch (e, s) {
            loggy.debug("failed getting ip info using [${source.key}]", e, s);
            error = e;
            continue;
          }
        }
        throw UnableToRetrieveIp(error, StackTrace.current);
      },
      ProxyUnexpectedFailure.new,
    );
  }

  @override
  TaskEither<ProxyFailure, List<ProxyGroupEntity>> getProxiesFromFile(String configPath) {
    return TaskEither.tryCatch(
      () async {
        loggy.debug("Reading proxies from file: $configPath");
        final file = File(configPath);
        if (!await file.exists()) {
          loggy.warning("Config file does not exist: $configPath");
          return [];
        }

        final content = await file.readAsString();
        final json = jsonDecode(content) as Map<String, dynamic>;
        final outbounds = json['outbounds'] as List<dynamic>?;

        if (outbounds == null || outbounds.isEmpty) {
          loggy.warning("No outbounds in config file");
          return [];
        }

        // Parse outbounds
        final List<ProxyItemEntity> proxyItems = [];
        final List<ProxyGroupEntity> groups = [];

        // Map to store selector/urltest outbound references
        final Map<String, List<String>> groupOutbounds = {};
        final Map<String, String> groupTypes = {};
        final Map<String, String> groupDefaults = {};

        for (final outbound in outbounds) {
          final ob = outbound as Map<String, dynamic>;
          final tag = ob['tag'] as String? ?? '';
          final type = ob['type'] as String? ?? '';

          // Skip system outbounds
          if (['direct', 'block', 'dns-out', 'bypass'].contains(tag)) {
            continue;
          }

          if (type == 'selector' || type == 'urltest') {
            // This is a group
            final outboundRefs = (ob['outbounds'] as List<dynamic>?)?.cast<String>() ?? [];
            final defaultTag = ob['default'] as String? ?? (outboundRefs.isNotEmpty ? outboundRefs.first : '');
            groupOutbounds[tag] = outboundRefs;
            groupTypes[tag] = type;
            groupDefaults[tag] = defaultTag;
          } else {
            // This is a proxy
            final proxyType = ProxyType.fromJson(type);
            proxyItems.add(ProxyItemEntity(
              tag: tag,
              type: proxyType,
              urlTestDelay: 0, // Unknown until tested
            ));
          }
        }

        // Also read xray proxies from .xray.json file
        final xrayProxies = await _readXrayProxies(configPath);

        // Build groups with their items (sing-box proxies only)
        for (final entry in groupOutbounds.entries) {
          final groupTag = entry.key;
          final outboundRefs = entry.value;
          final groupType = groupTypes[groupTag] ?? 'selector';
          final defaultSelected = groupDefaults[groupTag] ?? '';

          final items = proxyItems
              .where((p) => outboundRefs.contains(p.tag))
              .toList();

          if (items.isNotEmpty) {
            groups.add(ProxyGroupEntity(
              tag: groupTag,
              type: groupType == 'urltest' ? ProxyType.urltest : ProxyType.selector,
              selected: defaultSelected,
              items: items,
            ));
          }
        }

        // Add xray proxies as a separate group if there are any
        if (xrayProxies.isNotEmpty) {
          groups.add(ProxyGroupEntity(
            tag: 'Xray',
            type: ProxyType.selector,
            selected: xrayProxies.first.tag,
            items: xrayProxies,
          ));
        }

        // Combine all proxies for fallback group
        final allProxies = [...proxyItems, ...xrayProxies];

        // If no groups found, create a default "all" group with all proxies
        if (groups.isEmpty && allProxies.isNotEmpty) {
          groups.add(ProxyGroupEntity(
            tag: 'all',
            type: ProxyType.selector,
            selected: allProxies.first.tag,
            items: allProxies,
          ));
        }

        // Debug logging
        for (final group in groups) {
          loggy.debug("Group '${group.tag}' has ${group.items.length} items: ${group.items.map((p) => p.tag).join(', ')}");
        }

        loggy.debug("Parsed ${proxyItems.length} sing-box + ${xrayProxies.length} xray proxies in ${groups.length} groups from file");
        return groups;
      },
      (error, stackTrace) {
        loggy.error("Error reading proxies from file", error, stackTrace);
        return ProxyUnexpectedFailure(error, stackTrace);
      },
    );
  }

  /// Read xray proxies from .xray.json file
  Future<List<ProxyItemEntity>> _readXrayProxies(String configPath) async {
    // Derive xray config path: configs/uuid.json -> configs/uuid.xray.json
    final xrayPath = configPath.replaceAll('.json', '.xray.json');
    final xrayFile = File(xrayPath);

    if (!await xrayFile.exists()) {
      loggy.debug("No xray config file found at: $xrayPath");
      return [];
    }

    try {
      final content = await xrayFile.readAsString();
      final xrayConfigs = jsonDecode(content) as List<dynamic>;
      final List<ProxyItemEntity> xrayProxies = [];

      for (final config in xrayConfigs) {
        final cfg = config as Map<String, dynamic>;
        final remarks = cfg['remarks'] as String? ?? '';

        // Skip empty or info-only entries (like "0.204/3TB #No Time Limit")
        if (remarks.isEmpty || remarks.contains('/') && remarks.contains('TB')) {
          continue;
        }

        // Get the protocol from first non-system outbound
        final outbounds = cfg['outbounds'] as List<dynamic>?;
        if (outbounds == null || outbounds.isEmpty) continue;

        String protocol = 'unknown';
        for (final ob in outbounds) {
          final outbound = ob as Map<String, dynamic>;
          final tag = outbound['tag'] as String? ?? '';
          final proto = outbound['protocol'] as String? ?? '';

          // Skip system outbounds
          if (['fragment', 'direct', 'block', 'proxy'].contains(tag)) continue;

          // Found a real proxy outbound
          protocol = proto;
          break;
        }

        // Map xray protocol to ProxyType with 'x' prefix
        final proxyType = _xrayProtocolToType(protocol);

        xrayProxies.add(ProxyItemEntity(
          tag: remarks,
          type: proxyType,
          urlTestDelay: 0,
        ));
      }

      loggy.debug("Parsed ${xrayProxies.length} xray proxies from file");
      return xrayProxies;
    } catch (e, s) {
      loggy.warning("Error reading xray proxies from file", e, s);
      return [];
    }
  }

  /// Map xray protocol string to ProxyType
  ProxyType _xrayProtocolToType(String protocol) {
    return switch (protocol.toLowerCase()) {
      'vless' => ProxyType.xvless,
      'vmess' => ProxyType.xvmess,
      'trojan' => ProxyType.xtrojan,
      'shadowsocks' => ProxyType.xshadowsocks,
      'socks' => ProxyType.xsocks,
      'freedom' => ProxyType.xfreedom,
      _ => ProxyType.unknown,
    };
  }
}
