import 'dart:convert';

import 'package:flutter/foundation.dart';

/// Parsed proxy link with transport and core information
class ParsedProxyLink {
  const ParsedProxyLink({
    required this.protocol,
    required this.rawLink,
    this.uuid,
    this.host,
    this.port,
    this.transport,
    this.security,
    this.core,
    this.name,
    this.extra,
  });

  /// Protocol: vless, vmess, trojan, ss, etc.
  final String protocol;

  /// Original link
  final String rawLink;

  /// User UUID/password
  final String? uuid;

  /// Server host
  final String? host;

  /// Server port
  final int? port;

  /// Transport: tcp, ws, grpc, httpupgrade, xhttp, h2, quic
  final String? transport;

  /// Security: none, tls, reality
  final String? security;

  /// Preferred core: sing-box, xray (from core= param)
  final String? core;

  /// Config name from fragment
  final String? name;

  /// Extra JSON data (headers, downloadSettings, etc.)
  final Map<String, dynamic>? extra;

  /// Whether this config uses XHTTP transport
  bool get isXhttp => transport == 'xhttp' || transport == 'splithttp';

  /// Whether this config requires Xray-core
  bool get requiresXray => isXhttp || core == 'xray';

  /// Whether this config is supported by sing-box
  bool get isSingboxSupported => !isXhttp;

  /// Parse VLESS/Trojan style link (query parameters)
  static ParsedProxyLink? parseQueryStyle(String link) {
    final uri = Uri.tryParse(link);
    if (uri == null || !uri.hasScheme) return null;

    final protocol = uri.scheme.toLowerCase();
    if (!['vless', 'trojan', 'ss', 'hy2', 'hysteria2', 'tuic'].contains(protocol)) {
      return null;
    }

    final params = uri.queryParameters;
    Map<String, dynamic>? extra;

    // Parse extra JSON if present
    if (params['extra'] != null) {
      try {
        extra = jsonDecode(Uri.decodeComponent(params['extra']!)) as Map<String, dynamic>;
      } catch (e) {
        if (kDebugMode) debugPrint('ParsedProxyLink: Failed to parse extra JSON: $e');
      }
    }

    return ParsedProxyLink(
      protocol: protocol,
      rawLink: link,
      uuid: uri.userInfo,
      host: uri.host,
      port: uri.hasPort ? uri.port : null,
      transport: params['type'] ?? 'tcp',
      security: params['security'] ?? (params['sni'] != null ? 'tls' : 'none'),
      core: params['core'],
      name: uri.hasFragment ? Uri.decodeComponent(uri.fragment.split('&&')[0]) : null,
      extra: extra,
    );
  }

  /// Parse VMess link (base64 JSON)
  static ParsedProxyLink? parseVmess(String link) {
    if (!link.toLowerCase().startsWith('vmess://')) return null;

    try {
      final base64Part = link.substring(8);
      final jsonStr = utf8.decode(base64Decode(base64Part));
      final json = jsonDecode(jsonStr) as Map<String, dynamic>;

      Map<String, dynamic>? extra;
      if (json['extra'] != null) {
        try {
          if (json['extra'] is String) {
            extra = jsonDecode(json['extra'] as String) as Map<String, dynamic>;
          } else {
            extra = json['extra'] as Map<String, dynamic>;
          }
        } catch (e) {
          if (kDebugMode) debugPrint('ParsedProxyLink: Failed to parse vmess extra: $e');
        }
      }

      return ParsedProxyLink(
        protocol: 'vmess',
        rawLink: link,
        uuid: json['id'] as String?,
        host: json['add'] as String?,
        port: int.tryParse(json['port']?.toString() ?? ''),
        transport: json['net'] as String? ?? 'tcp',
        security: json['tls'] as String? ?? 'none',
        core: json['core'] as String?,
        name: json['ps'] as String?,
        extra: extra,
      );
    } catch (_) {
      return null;
    }
  }

  /// Parse any proxy link
  static ParsedProxyLink? parse(String link) {
    final trimmed = link.trim();
    if (trimmed.toLowerCase().startsWith('vmess://')) {
      return parseVmess(trimmed);
    }
    return parseQueryStyle(trimmed);
  }

  /// Parse multiple links from content (newline separated)
  static List<ParsedProxyLink> parseAll(String content) {
    final results = <ParsedProxyLink>[];
    final lines = content.split('\n');

    for (final line in lines) {
      final trimmed = line.trim();
      if (trimmed.isEmpty || trimmed.startsWith('#')) continue;

      final parsed = parse(trimmed);
      if (parsed != null) {
        results.add(parsed);
      }
    }

    return results;
  }

  /// Count XHTTP configs in a list
  static int countXhttp(List<ParsedProxyLink> links) {
    return links.where((l) => l.isXhttp).length;
  }

  /// Filter out unsupported configs
  static List<ParsedProxyLink> filterSupported(List<ParsedProxyLink> links) {
    return links.where((l) => l.isSingboxSupported).toList();
  }

  @override
  String toString() {
    return 'ParsedProxyLink(protocol: $protocol, host: $host, transport: $transport, core: $core, isXhttp: $isXhttp)';
  }
}
