import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiddify/core/localization/translations.dart';

@JsonEnum(valueField: 'key')
enum ServiceMode {
  // Yumash Edition: Only VPN mode supported (works with all apps, not just browsers)
  tun("vpn");

  const ServiceMode(this.key);

  final String key;

  // Default and only mode: VPN (TUN)
  static ServiceMode get defaultMode => tun;

  /// Only VPN mode available
  static List<ServiceMode> get choices => [tun];

  // VPN is no longer experimental - app runs as admin
  bool get isExperimental => false;

  String present(TranslationsEn t) => t.config.serviceModes.tun;

  String presentShort(TranslationsEn t) => t.config.shortServiceModes.tun;
}

@JsonEnum(valueField: 'key')
enum DomainStrategy {
  auto(""),
  preferIpv4("prefer_ipv4"),
  ipv4Only("ipv4_only");

  const DomainStrategy(this.key);

  final String key;

  String get displayName => switch (this) {
        auto => "auto",
        _ => key,
      };
}

enum TunImplementation {
  mixed,
  system,
  gvisor;
}

enum MuxProtocol {
  h2mux,
  smux,
  yamux;
}
