import 'package:dartx/dartx.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hiddify/core/model/optional_range.dart';
import 'package:hiddify/core/model/region.dart';
import 'package:hiddify/core/utils/exception_handler.dart';
import 'package:hiddify/core/utils/json_converters.dart';
import 'package:hiddify/core/utils/preferences_utils.dart';
import 'package:hiddify/features/config_option/model/config_option_failure.dart';

import 'package:hiddify/features/log/model/log_level.dart';
import 'package:hiddify/singbox/model/singbox_config_enum.dart';
import 'package:hiddify/singbox/model/singbox_config_option.dart';
import 'package:hiddify/singbox/model/singbox_rule.dart';
import 'package:hiddify/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ConfigOptions {
  static final serviceMode = PreferencesNotifier.create<ServiceMode, String>(
    "service-mode",
    ServiceMode.defaultMode,
    mapFrom: (value) => ServiceMode.choices.firstWhere((e) => e.key == value),
    mapTo: (value) => value.key,
  );

  static final region = PreferencesNotifier.create<Region, String>(
    "region",
    Region.other,
    mapFrom: Region.values.byName,
    mapTo: (value) => value.name,
  );
  static final useXrayCoreWhenPossible = PreferencesNotifier.create<bool, bool>(
    "use-xray-core-when-possible",
    false,
  );
  static final blockAds = PreferencesNotifier.create<bool, bool>(
    "block-ads",
    false,
  );
  static final logLevel = PreferencesNotifier.create<LogLevel, String>(
    "log-level",
    LogLevel.warn,
    mapFrom: LogLevel.values.byName,
    mapTo: (value) => value.name,
  );

  static final resolveDestination = PreferencesNotifier.create<bool, bool>(
    "resolve-destination",
    false,
  );

  static final remoteDnsAddress = PreferencesNotifier.create<String, String>(
    "remote-dns-address",
    "udp://1.1.1.1",
    possibleValues: List.of([
      "local",
      "udp://223.5.5.5",
      "udp://1.1.1.1",
      "udp://1.1.1.2",
      "tcp://1.1.1.1",
      "https://1.1.1.1/dns-query",
      "https://sky.rethinkdns.com/dns-query",
      "4.4.2.2",
      "8.8.8.8",
    ]),
    validator: (value) => value.isNotBlank,
  );

  static final remoteDnsDomainStrategy = PreferencesNotifier.create<DomainStrategy, String>(
    "remote-dns-domain-strategy",
    DomainStrategy.auto,
    mapFrom: (value) => DomainStrategy.values.firstWhere((e) => e.key == value),
    mapTo: (value) => value.key,
  );

  static final directDnsAddress = PreferencesNotifier.create<String, String>(
    "direct-dns-address",
    "udp://1.1.1.1",
    possibleValues: List.of([
      "local",
      "udp://223.5.5.5",
      "udp://1.1.1.1",
      "udp://1.1.1.2",
      "tcp://1.1.1.1",
      "https://1.1.1.1/dns-query",
      "https://sky.rethinkdns.com/dns-query",
      "4.4.2.2",
      "8.8.8.8",
    ]),
    defaultValueFunction: (ref) => "1.1.1.1",
    validator: (value) => value.isNotBlank,
  );

  static final directDnsDomainStrategy = PreferencesNotifier.create<DomainStrategy, String>(
    "direct-dns-domain-strategy",
    DomainStrategy.auto,
    mapFrom: (value) => DomainStrategy.values.firstWhere((e) => e.key == value),
    mapTo: (value) => value.key,
  );

  // Yumash Edition: Using different ports to allow running alongside original Hiddify
  // Original Hiddify uses: 12334, 12335, 16450
  static final mixedPort = PreferencesNotifier.create<int, int>(
    "mixed-port",
    22334,
    validator: (value) => isPort(value.toString()),
  );

  static final tproxyPort = PreferencesNotifier.create<int, int>(
    "tproxy-port",
    22335,
    validator: (value) => isPort(value.toString()),
  );

  static final localDnsPort = PreferencesNotifier.create<int, int>(
    "local-dns-port",
    26450,
    validator: (value) => isPort(value.toString()),
  );

  static final tunImplementation = PreferencesNotifier.create<TunImplementation, String>(
    "tun-implementation",
    TunImplementation.gvisor,
    mapFrom: TunImplementation.values.byName,
    mapTo: (value) => value.name,
  );

  static final mtu = PreferencesNotifier.create<int, int>("mtu", 1400);

  static final strictRoute = PreferencesNotifier.create<bool, bool>("strict-route", true);

  // TUN/VPN subnet address (CIDR format)
  // Yumash Edition: Using 100.64.1.x to allow running alongside original Hiddify (100.64.0.x)
  static final tunAddress = PreferencesNotifier.create<String, String>(
    "tun-address",
    "100.64.1.1/28", // CGNAT range, different from original Hiddify
    validator: (value) => RegExp(r'^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/\d{1,2}$').hasMatch(value),
  );

  static final connectionTestUrl = PreferencesNotifier.create<String, String>(
    "connection-test-url",
    "http://cp.cloudflare.com",
    possibleValues: List.of([
      "http://connectivitycheck.gstatic.com/generate_204",
      "http://www.gstatic.com/generate_204",
      "https://www.gstatic.com/generate_204",
      "http://cp.cloudflare.com",
      "http://kernel.org",
      "http://detectportal.firefox.com",
      "http://captive.apple.com/hotspot-detect.html",
      "https://1.1.1.1",
      "http://1.1.1.1",
    ]),
    validator: (value) => value.isNotBlank && isUrl(value),
  );

  static final urlTestInterval = PreferencesNotifier.create<Duration, int>(
    "url-test-interval",
    const Duration(minutes: 10),
    mapFrom: const IntervalInSecondsConverter().fromJson,
    mapTo: const IntervalInSecondsConverter().toJson,
  );

  static final bypassLan = PreferencesNotifier.create<bool, bool>("bypass-lan", true);

  // LAN bypass IP ranges (CIDR notation, comma-separated)
  static final lanBypassIps = PreferencesNotifier.create<String, String>(
    "lan-bypass-ips",
    "192.168.0.0/16,10.0.0.0/8,172.16.0.0/12", // Default private ranges
  );

  static final allowConnectionFromLan = PreferencesNotifier.create<bool, bool>(
    "allow-connection-from-lan",
    false,
  );

  static final excludedDomains = PreferencesNotifier.create<String, String>(
    "excluded-domains",
    "",
  );

  static final excludedIps = PreferencesNotifier.create<String, String>(
    "excluded-ips",
    "",
  );

  static final excludedProcesses = PreferencesNotifier.create<String, String>(
    "excluded-processes",
    "",
  );

  // Russian bypass options - direct traffic for Russia
  static final bypassRussianDomains = PreferencesNotifier.create<bool, bool>(
    "bypass-russian-domains",
    false,
  );

  static final bypassRussianIps = PreferencesNotifier.create<bool, bool>(
    "bypass-russian-ips",
    false,
  );

  // Custom URLs for rule-sets
  // Block Ads rule-set URLs (comma-separated)
  static final blockAdsRuleSetUrls = PreferencesNotifier.create<String, String>(
    "block-ads-ruleset-urls",
    // Default URLs from hiddify-geo
    "https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/block/geosite-category-ads-all.srs,"
    "https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/block/geosite-malware.srs,"
    "https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/block/geosite-phishing.srs,"
    "https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/block/geosite-cryptominers.srs,"
    "https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/block/geoip-malware.srs,"
    "https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/block/geoip-phishing.srs",
  );

  // Russian bypass geosite URL
  static final russianGeositeUrl = PreferencesNotifier.create<String, String>(
    "russian-geosite-url",
    "https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/country/geosite-ru.srs",
  );

  // Russian bypass geoip URL
  static final russianGeoipUrl = PreferencesNotifier.create<String, String>(
    "russian-geoip-url",
    "https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/country/geoip-ru.srs",
  );

  // Rule-set update interval (cached locally, default 7 days)
  static final ruleSetUpdateInterval = PreferencesNotifier.create<Duration, int>(
    "rule-set-update-interval",
    const Duration(days: 7),
    mapFrom: const IntervalInSecondsConverter().fromJson,
    mapTo: const IntervalInSecondsConverter().toJson,
  );

  static final enableFakeDns = PreferencesNotifier.create<bool, bool>(
    "enable-fake-dns",
    false,
  );

  static final enableDnsRouting = PreferencesNotifier.create<bool, bool>(
    "enable-dns-routing",
    true,
  );

  static final independentDnsCache = PreferencesNotifier.create<bool, bool>(
    "independent-dns-cache",
    true,
  );

  static final enableTlsFragment = PreferencesNotifier.create<bool, bool>(
    "enable-tls-fragment",
    false,
  );

  static final tlsFragmentSize = PreferencesNotifier.create<OptionalRange, String>(
    "tls-fragment-size",
    const OptionalRange(min: 10, max: 30),
    mapFrom: OptionalRange.parse,
    mapTo: const OptionalRangeJsonConverter().toJson,
  );

  static final tlsFragmentSleep = PreferencesNotifier.create<OptionalRange, String>(
    "tls-fragment-sleep",
    const OptionalRange(min: 2, max: 8),
    mapFrom: OptionalRange.parse,
    mapTo: const OptionalRangeJsonConverter().toJson,
  );

  static final enableTlsMixedSniCase = PreferencesNotifier.create<bool, bool>(
    "enable-tls-mixed-sni-case",
    false,
  );

  static final enableTlsPadding = PreferencesNotifier.create<bool, bool>(
    "enable-tls-padding",
    false,
  );

  static final tlsPaddingSize = PreferencesNotifier.create<OptionalRange, String>(
    "tls-padding-size",
    const OptionalRange(min: 1, max: 1500),
    mapFrom: OptionalRange.parse,
    mapTo: const OptionalRangeJsonConverter().toJson,
  );

  static final enableMux = PreferencesNotifier.create<bool, bool>(
    "enable-mux",
    false,
  );

  static final muxPadding = PreferencesNotifier.create<bool, bool>(
    "mux-padding",
    false,
  );

  static final muxMaxStreams = PreferencesNotifier.create<int, int>(
    "mux-max-streams",
    8,
    validator: (value) => value > 0,
  );

  static final muxProtocol = PreferencesNotifier.create<MuxProtocol, String>(
    "mux-protocol",
    MuxProtocol.h2mux,
    mapFrom: MuxProtocol.values.byName,
    mapTo: (value) => value.name,
  );

  // WireGuard LAN Server settings
  static final wgServerEnabled = PreferencesNotifier.create<bool, bool>(
    "wg-server-enabled",
    false,
  );

  static final wgServerPort = PreferencesNotifier.create<int, int>(
    "wg-server-port",
    51820,
    validator: (value) => isPort(value.toString()),
  );

  static final wgServerSubnet = PreferencesNotifier.create<String, String>(
    "wg-server-subnet",
    "10.10.0.0/24",
    validator: (value) => RegExp(r'^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/\d{1,2}$').hasMatch(value),
  );

  static final wgServerPrivateKey = PreferencesNotifier.create<String, String>(
    "wg-server-private-key",
    "",
  );

  static final wgServerPublicKey = PreferencesNotifier.create<String, String>(
    "wg-server-public-key",
    "",
  );

  static final wgClientPrivateKey = PreferencesNotifier.create<String, String>(
    "wg-client-private-key",
    "",
  );

  static final wgClientPublicKey = PreferencesNotifier.create<String, String>(
    "wg-client-public-key",
    "",
  );

  static final hasExperimentalFeatures = Provider.autoDispose<bool>(
    (ref) {
      final mode = ref.watch(serviceMode);
      if (PlatformUtils.isDesktop && mode == ServiceMode.tun) {
        return true;
      }
      if (ref.watch(enableTlsFragment) || ref.watch(enableTlsMixedSniCase) || ref.watch(enableTlsPadding) || ref.watch(enableMux) || ref.watch(bypassLan) || ref.watch(allowConnectionFromLan)) {
        return true;
      }

      return false;
    },
  );

  static final Map<String, NotifierProvider<PreferencesNotifier, dynamic>> preferences = {
    "region": region,
    "block-ads": blockAds,
    "use-xray-core-when-possible": useXrayCoreWhenPossible,
    "service-mode": serviceMode,
    "log-level": logLevel,
    "resolve-destination": resolveDestination,
    "remote-dns-address": remoteDnsAddress,
    "remote-dns-domain-strategy": remoteDnsDomainStrategy,
    "direct-dns-address": directDnsAddress,
    "direct-dns-domain-strategy": directDnsDomainStrategy,
    "mixed-port": mixedPort,
    "tproxy-port": tproxyPort,
    "local-dns-port": localDnsPort,
    "tun-implementation": tunImplementation,
    "mtu": mtu,
    "strict-route": strictRoute,
    "tun-address": tunAddress,
    "connection-test-url": connectionTestUrl,
    "url-test-interval": urlTestInterval,
    "bypass-lan": bypassLan,
    "lan-bypass-ips": lanBypassIps,
    "allow-connection-from-lan": allowConnectionFromLan,
    "excluded-domains": excludedDomains,
    "excluded-ips": excludedIps,
    "excluded-processes": excludedProcesses,
    "enable-dns-routing": enableDnsRouting,
    "bypass-russian-domains": bypassRussianDomains,
    "bypass-russian-ips": bypassRussianIps,
    "block-ads-ruleset-urls": blockAdsRuleSetUrls,
    "russian-geosite-url": russianGeositeUrl,
    "russian-geoip-url": russianGeoipUrl,
    "rule-set-update-interval": ruleSetUpdateInterval,

    // mux
    "mux.enable": enableMux,
    "mux.padding": muxPadding,
    "mux.max-streams": muxMaxStreams,
    "mux.protocol": muxProtocol,

    // tls-tricks
    "tls-tricks.enable-fragment": enableTlsFragment,
    "tls-tricks.fragment-size": tlsFragmentSize,
    "tls-tricks.fragment-sleep": tlsFragmentSleep,
    "tls-tricks.mixed-sni-case": enableTlsMixedSniCase,
    "tls-tricks.enable-padding": enableTlsPadding,
    "tls-tricks.padding-size": tlsPaddingSize,

    // wireguard-server
    "wg-server-enabled": wgServerEnabled,
    "wg-server-port": wgServerPort,
    "wg-server-subnet": wgServerSubnet,
    "wg-server-private-key": wgServerPrivateKey,
    "wg-server-public-key": wgServerPublicKey,
    "wg-client-private-key": wgClientPrivateKey,
    "wg-client-public-key": wgClientPublicKey,
  };

  static final singboxConfigOptions = FutureProvider<SingboxConfigOption>(
    (ref) {
      final rules = <SingboxRule>[];

      return SingboxConfigOption(
        region: ref.watch(region).name,
        blockAds: ref.watch(blockAds),
        useXrayCoreWhenPossible: ref.watch(useXrayCoreWhenPossible),
        executeConfigAsIs: false,
        logLevel: ref.watch(logLevel),
        resolveDestination: ref.watch(resolveDestination),
        remoteDnsAddress: ref.watch(remoteDnsAddress),
        remoteDnsDomainStrategy: ref.watch(remoteDnsDomainStrategy),
        directDnsAddress: ref.watch(directDnsAddress),
        directDnsDomainStrategy: ref.watch(directDnsDomainStrategy),
        mixedPort: ref.watch(mixedPort),
        tproxyPort: ref.watch(tproxyPort),
        localDnsPort: ref.watch(localDnsPort),
        tunImplementation: ref.watch(tunImplementation),
        mtu: ref.watch(mtu),
        strictRoute: ref.watch(strictRoute),
        tunAddress: ref.watch(tunAddress),
        connectionTestUrl: ref.watch(connectionTestUrl),
        urlTestInterval: ref.watch(urlTestInterval),
        enableTun: true, // Yumash Edition: VPN mode always enabled
        enableTunService: false, // Not used in Yumash Edition
        setSystemProxy: false, // Not used in Yumash Edition
        bypassLan: ref.watch(bypassLan),
        lanBypassIps: ref.watch(lanBypassIps),
        allowConnectionFromLan: ref.watch(allowConnectionFromLan),
        excludedDomains: ref.watch(excludedDomains),
        excludedIps: ref.watch(excludedIps),
        excludedProcesses: ref.watch(excludedProcesses),
        bypassRussianDomains: ref.watch(bypassRussianDomains),
        bypassRussianIps: ref.watch(bypassRussianIps),
        blockAdsRuleSetUrls: ref.watch(blockAdsRuleSetUrls),
        russianGeositeUrl: ref.watch(russianGeositeUrl),
        russianGeoipUrl: ref.watch(russianGeoipUrl),
        ruleSetUpdateInterval: ref.watch(ruleSetUpdateInterval),
        enableFakeDns: ref.watch(enableFakeDns),
        enableDnsRouting: ref.watch(enableDnsRouting),
        independentDnsCache: ref.watch(independentDnsCache),
        mux: SingboxMuxOption(
          enable: ref.watch(enableMux),
          padding: ref.watch(muxPadding),
          maxStreams: ref.watch(muxMaxStreams),
          protocol: ref.watch(muxProtocol),
        ),
        tlsTricks: SingboxTlsTricks(
          enableFragment: ref.watch(enableTlsFragment),
          fragmentSize: ref.watch(tlsFragmentSize),
          fragmentSleep: ref.watch(tlsFragmentSleep),
          mixedSniCase: ref.watch(enableTlsMixedSniCase),
          enablePadding: ref.watch(enableTlsPadding),
          paddingSize: ref.watch(tlsPaddingSize),
        ),
        rules: rules,
        // WireGuard LAN Server
        wgServerEnabled: ref.watch(wgServerEnabled),
        wgServerPort: ref.watch(wgServerPort),
        wgServerSubnet: ref.watch(wgServerSubnet),
        wgServerPrivateKey: ref.watch(wgServerPrivateKey),
        wgServerPublicKey: ref.watch(wgServerPublicKey),
        wgClientPrivateKey: ref.watch(wgClientPrivateKey),
        wgClientPublicKey: ref.watch(wgClientPublicKey),
      );
    },
  );
}

class ConfigOptionRepository with ExceptionHandler, InfraLogger {
  ConfigOptionRepository({
    required this.preferences,
    required this.getConfigOptions,
  });

  final SharedPreferences preferences;
  final Future<SingboxConfigOption> Function() getConfigOptions;

  TaskEither<ConfigOptionFailure, SingboxConfigOption> getFullSingboxConfigOption() {
    return exceptionHandler(
      () async {
        return right(await getConfigOptions());
      },
      ConfigOptionUnexpectedFailure.new,
    );
  }
}
