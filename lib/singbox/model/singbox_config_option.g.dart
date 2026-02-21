// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singbox_config_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SingboxConfigOption _$SingboxConfigOptionFromJson(Map<String, dynamic> json) =>
    _SingboxConfigOption(
      region: json['region'] as String,
      blockAds: json['block-ads'] as bool,
      useXrayCoreWhenPossible: json['use-xray-core-when-possible'] as bool,
      executeConfigAsIs: json['execute-config-as-is'] as bool,
      logLevel: $enumDecode(_$LogLevelEnumMap, json['log-level']),
      resolveDestination: json['resolve-destination'] as bool,
      remoteDnsAddress: json['remote-dns-address'] as String,
      remoteDnsDomainStrategy: $enumDecode(
        _$DomainStrategyEnumMap,
        json['remote-dns-domain-strategy'],
      ),
      directDnsAddress: json['direct-dns-address'] as String,
      directDnsDomainStrategy: $enumDecode(
        _$DomainStrategyEnumMap,
        json['direct-dns-domain-strategy'],
      ),
      mixedPort: (json['mixed-port'] as num).toInt(),
      tproxyPort: (json['tproxy-port'] as num).toInt(),
      localDnsPort: (json['local-dns-port'] as num).toInt(),
      tunImplementation: $enumDecode(
        _$TunImplementationEnumMap,
        json['tun-implementation'],
      ),
      mtu: (json['mtu'] as num).toInt(),
      strictRoute: json['strict-route'] as bool,
      tunAddress: json['tun-address'] as String? ?? '100.64.1.1/28',
      connectionTestUrl: json['connection-test-url'] as String,
      urlTestInterval: const IntervalInSecondsConverter().fromJson(
        (json['url-test-interval'] as num).toInt(),
      ),
      enableTun: json['enable-tun'] as bool,
      enableTunService: json['enable-tun-service'] as bool,
      setSystemProxy: json['set-system-proxy'] as bool,
      bypassLan: json['bypass-lan'] as bool,
      lanBypassIps:
          json['lan-bypass-ips'] as String? ??
          '192.168.0.0/16,10.0.0.0/8,172.16.0.0/12',
      allowConnectionFromLan: json['allow-connection-from-lan'] as bool,
      excludedDomains: json['excluded-domains'] as String? ?? '',
      excludedIps: json['excluded-ips'] as String? ?? '',
      excludedProcesses: json['excluded-processes'] as String? ?? '',
      bypassRussianDomains: json['bypass-russian-domains'] as bool? ?? false,
      bypassRussianIps: json['bypass-russian-ips'] as bool? ?? false,
      blockAdsRuleSetUrls: json['block-ads-rule-set-urls'] as String? ?? '',
      russianGeositeUrl: json['russian-geosite-url'] as String? ?? '',
      russianGeoipUrl: json['russian-geoip-url'] as String? ?? '',
      ruleSetUpdateInterval: json['rule-set-update-interval'] == null
          ? const Duration(days: 7)
          : const IntervalInSecondsConverter().fromJson(
              (json['rule-set-update-interval'] as num).toInt(),
            ),
      enableFakeDns: json['enable-fake-dns'] as bool,
      enableDnsRouting: json['enable-dns-routing'] as bool,
      independentDnsCache: json['independent-dns-cache'] as bool,
      rules: (json['rules'] as List<dynamic>)
          .map((e) => SingboxRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      mux: SingboxMuxOption.fromJson(json['mux'] as Map<String, dynamic>),
      tlsTricks: SingboxTlsTricks.fromJson(
        json['tls-tricks'] as Map<String, dynamic>,
      ),
      wgServerEnabled: json['wg-server-enabled'] as bool? ?? false,
      wgServerPort: (json['wg-server-port'] as num?)?.toInt() ?? 51820,
      wgServerSubnet: json['wg-server-subnet'] as String? ?? '10.10.0.0/24',
      wgServerPrivateKey: json['wg-server-private-key'] as String? ?? '',
      wgServerPublicKey: json['wg-server-public-key'] as String? ?? '',
      wgClientPrivateKey: json['wg-client-private-key'] as String? ?? '',
      wgClientPublicKey: json['wg-client-public-key'] as String? ?? '',
    );

Map<String, dynamic> _$SingboxConfigOptionToJson(
  _SingboxConfigOption instance,
) => <String, dynamic>{
  'region': instance.region,
  'block-ads': instance.blockAds,
  'use-xray-core-when-possible': instance.useXrayCoreWhenPossible,
  'execute-config-as-is': instance.executeConfigAsIs,
  'log-level': _$LogLevelEnumMap[instance.logLevel]!,
  'resolve-destination': instance.resolveDestination,
  'remote-dns-address': instance.remoteDnsAddress,
  'remote-dns-domain-strategy':
      _$DomainStrategyEnumMap[instance.remoteDnsDomainStrategy]!,
  'direct-dns-address': instance.directDnsAddress,
  'direct-dns-domain-strategy':
      _$DomainStrategyEnumMap[instance.directDnsDomainStrategy]!,
  'mixed-port': instance.mixedPort,
  'tproxy-port': instance.tproxyPort,
  'local-dns-port': instance.localDnsPort,
  'tun-implementation': _$TunImplementationEnumMap[instance.tunImplementation]!,
  'mtu': instance.mtu,
  'strict-route': instance.strictRoute,
  'tun-address': instance.tunAddress,
  'connection-test-url': instance.connectionTestUrl,
  'url-test-interval': const IntervalInSecondsConverter().toJson(
    instance.urlTestInterval,
  ),
  'enable-tun': instance.enableTun,
  'enable-tun-service': instance.enableTunService,
  'set-system-proxy': instance.setSystemProxy,
  'bypass-lan': instance.bypassLan,
  'lan-bypass-ips': instance.lanBypassIps,
  'allow-connection-from-lan': instance.allowConnectionFromLan,
  'excluded-domains': instance.excludedDomains,
  'excluded-ips': instance.excludedIps,
  'excluded-processes': instance.excludedProcesses,
  'bypass-russian-domains': instance.bypassRussianDomains,
  'bypass-russian-ips': instance.bypassRussianIps,
  'block-ads-rule-set-urls': instance.blockAdsRuleSetUrls,
  'russian-geosite-url': instance.russianGeositeUrl,
  'russian-geoip-url': instance.russianGeoipUrl,
  'rule-set-update-interval': const IntervalInSecondsConverter().toJson(
    instance.ruleSetUpdateInterval,
  ),
  'enable-fake-dns': instance.enableFakeDns,
  'enable-dns-routing': instance.enableDnsRouting,
  'independent-dns-cache': instance.independentDnsCache,
  'rules': instance.rules.map((e) => e.toJson()).toList(),
  'mux': instance.mux.toJson(),
  'tls-tricks': instance.tlsTricks.toJson(),
  'wg-server-enabled': instance.wgServerEnabled,
  'wg-server-port': instance.wgServerPort,
  'wg-server-subnet': instance.wgServerSubnet,
  'wg-server-private-key': instance.wgServerPrivateKey,
  'wg-server-public-key': instance.wgServerPublicKey,
  'wg-client-private-key': instance.wgClientPrivateKey,
  'wg-client-public-key': instance.wgClientPublicKey,
};

const _$LogLevelEnumMap = {
  LogLevel.trace: 'trace',
  LogLevel.debug: 'debug',
  LogLevel.info: 'info',
  LogLevel.warn: 'warn',
  LogLevel.error: 'error',
  LogLevel.fatal: 'fatal',
  LogLevel.panic: 'panic',
};

const _$DomainStrategyEnumMap = {
  DomainStrategy.auto: '',
  DomainStrategy.preferIpv4: 'prefer_ipv4',
  DomainStrategy.ipv4Only: 'ipv4_only',
};

const _$TunImplementationEnumMap = {
  TunImplementation.mixed: 'mixed',
  TunImplementation.system: 'system',
  TunImplementation.gvisor: 'gvisor',
};

_SingboxMuxOption _$SingboxMuxOptionFromJson(Map<String, dynamic> json) =>
    _SingboxMuxOption(
      enable: json['enable'] as bool,
      padding: json['padding'] as bool,
      maxStreams: (json['max-streams'] as num).toInt(),
      protocol: $enumDecode(_$MuxProtocolEnumMap, json['protocol']),
    );

Map<String, dynamic> _$SingboxMuxOptionToJson(_SingboxMuxOption instance) =>
    <String, dynamic>{
      'enable': instance.enable,
      'padding': instance.padding,
      'max-streams': instance.maxStreams,
      'protocol': _$MuxProtocolEnumMap[instance.protocol]!,
    };

const _$MuxProtocolEnumMap = {
  MuxProtocol.h2mux: 'h2mux',
  MuxProtocol.smux: 'smux',
  MuxProtocol.yamux: 'yamux',
};

_SingboxTlsTricks _$SingboxTlsTricksFromJson(Map<String, dynamic> json) =>
    _SingboxTlsTricks(
      enableFragment: json['enable-fragment'] as bool,
      fragmentSize: const OptionalRangeJsonConverter().fromJson(
        json['fragment-size'] as String,
      ),
      fragmentSleep: const OptionalRangeJsonConverter().fromJson(
        json['fragment-sleep'] as String,
      ),
      mixedSniCase: json['mixed-sni-case'] as bool,
      enablePadding: json['enable-padding'] as bool,
      paddingSize: const OptionalRangeJsonConverter().fromJson(
        json['padding-size'] as String,
      ),
    );

Map<String, dynamic> _$SingboxTlsTricksToJson(_SingboxTlsTricks instance) =>
    <String, dynamic>{
      'enable-fragment': instance.enableFragment,
      'fragment-size': const OptionalRangeJsonConverter().toJson(
        instance.fragmentSize,
      ),
      'fragment-sleep': const OptionalRangeJsonConverter().toJson(
        instance.fragmentSleep,
      ),
      'mixed-sni-case': instance.mixedSniCase,
      'enable-padding': instance.enablePadding,
      'padding-size': const OptionalRangeJsonConverter().toJson(
        instance.paddingSize,
      ),
    };
