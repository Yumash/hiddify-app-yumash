import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiddify/core/model/optional_range.dart';
import 'package:hiddify/core/utils/json_converters.dart';
import 'package:hiddify/features/log/model/log_level.dart';
import 'package:hiddify/singbox/model/singbox_config_enum.dart';
import 'package:hiddify/singbox/model/singbox_rule.dart';

part 'singbox_config_option.freezed.dart';
part 'singbox_config_option.g.dart';

@freezed
abstract class SingboxConfigOption with _$SingboxConfigOption {
  const SingboxConfigOption._();

  @JsonSerializable(fieldRename: FieldRename.kebab)
  const factory SingboxConfigOption({
    required String region,
    required bool blockAds,
    required bool useXrayCoreWhenPossible,
    required bool executeConfigAsIs,
    required LogLevel logLevel,
    required bool resolveDestination,
    required String remoteDnsAddress,
    required DomainStrategy remoteDnsDomainStrategy,
    required String directDnsAddress,
    required DomainStrategy directDnsDomainStrategy,
    required int mixedPort,
    required int tproxyPort,
    required int localDnsPort,
    required TunImplementation tunImplementation,
    required int mtu,
    required bool strictRoute,
    @Default('100.64.1.1/28') String tunAddress,
    required String connectionTestUrl,
    @IntervalInSecondsConverter() required Duration urlTestInterval,
    required bool enableTun,
    required bool enableTunService,
    required bool setSystemProxy,
    required bool bypassLan,
    @Default('192.168.0.0/16,10.0.0.0/8,172.16.0.0/12') String lanBypassIps,
    required bool allowConnectionFromLan,
    @Default('') String excludedDomains,
    @Default('') String excludedIps,
    @Default('') String excludedProcesses,
    @Default(false) bool bypassRussianDomains,
    @Default(false) bool bypassRussianIps,
    @Default('') String blockAdsRuleSetUrls,
    @Default('') String russianGeositeUrl,
    @Default('') String russianGeoipUrl,
    @IntervalInSecondsConverter() @Default(Duration(days: 7)) Duration ruleSetUpdateInterval,
    required bool enableFakeDns,
    required bool enableDnsRouting,
    required bool independentDnsCache,
    required List<SingboxRule> rules,
    required SingboxMuxOption mux,
    required SingboxTlsTricks tlsTricks,
    // WireGuard LAN Server
    @Default(false) bool wgServerEnabled,
    @Default(51820) int wgServerPort,
    @Default('10.10.0.0/24') String wgServerSubnet,
    @Default('') String wgServerPrivateKey,
    @Default('') String wgServerPublicKey,
    @Default('') String wgClientPrivateKey,
    @Default('') String wgClientPublicKey,
  }) = _SingboxConfigOption;

  String format() {
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(toJson());
  }

  factory SingboxConfigOption.fromJson(Map<String, dynamic> json) => _$SingboxConfigOptionFromJson(json);
}

@freezed
abstract class SingboxMuxOption with _$SingboxMuxOption {
  @JsonSerializable(fieldRename: FieldRename.kebab)
  const factory SingboxMuxOption({
    required bool enable,
    required bool padding,
    required int maxStreams,
    required MuxProtocol protocol,
  }) = _SingboxMuxOption;

  factory SingboxMuxOption.fromJson(Map<String, dynamic> json) => _$SingboxMuxOptionFromJson(json);
}

@freezed
abstract class SingboxTlsTricks with _$SingboxTlsTricks {
  @JsonSerializable(fieldRename: FieldRename.kebab)
  const factory SingboxTlsTricks({
    required bool enableFragment,
    @OptionalRangeJsonConverter() required OptionalRange fragmentSize,
    @OptionalRangeJsonConverter() required OptionalRange fragmentSleep,
    required bool mixedSniCase,
    required bool enablePadding,
    @OptionalRangeJsonConverter() required OptionalRange paddingSize,
  }) = _SingboxTlsTricks;

  factory SingboxTlsTricks.fromJson(Map<String, dynamic> json) => _$SingboxTlsTricksFromJson(json);
}
