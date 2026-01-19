import 'package:hiddify/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesMigration with InfraLogger {
  PreferencesMigration({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  static const versionKey = "preferences_version";

  Future<void> migrate() async {
    final currentVersion = sharedPreferences.getInt(versionKey) ?? 0;

    final migrationSteps = [
      PreferencesVersion1Migration(sharedPreferences),
    ];

    if (currentVersion == migrationSteps.length) {
      loggy.debug("already using the latest version (v$currentVersion)");
      return;
    }

    final stopWatch = Stopwatch()..start();
    loggy.debug(
      "migrating from v[$currentVersion] to v[${migrationSteps.length}]",
    );
    for (int i = currentVersion; i < migrationSteps.length; i++) {
      loggy.debug("step [$i](v${i + 1})");
      await migrationSteps[i].migrate();
      await sharedPreferences.setInt(versionKey, i + 1);
    }
    stopWatch.stop();
    loggy.debug("migration took [${stopWatch.elapsedMilliseconds}]ms");
  }
}

abstract interface class PreferencesMigrationStep {
  PreferencesMigrationStep(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  Future<void> migrate();
}

class PreferencesVersion1Migration extends PreferencesMigrationStep
    with InfraLogger {
  PreferencesVersion1Migration(super.sharedPreferences);

  @override
  Future<void> migrate() async {
    if (sharedPreferences.getString("service-mode")
        case final String serviceMode) {
      final newMode = switch (serviceMode) {
        "proxy" || "system-proxy" || "vpn" => serviceMode,
        "systemProxy" => "system-proxy",
        "tun" => "vpn",
        _ => PlatformUtils.isDesktop ? "system-proxy" : "vpn",
      };
      loggy.debug(
        "changing service-mode from [$serviceMode] to [$newMode]",
      );
      await sharedPreferences.setString("service-mode", newMode);
    }

    // Remove old ipv6-mode setting (no longer used)
    await sharedPreferences.remove("ipv6-mode");

    if (sharedPreferences.getString("remote-domain-dns-strategy")
        case final String remoteDomainStrategy) {
      loggy.debug(
        "changing [remote-domain-dns-strategy] = [$remoteDomainStrategy] to [remote-dns-domain-strategy] = [${_domainStrategyMapper(remoteDomainStrategy)}]",
      );
      await sharedPreferences.remove("remote-domain-dns-strategy");
      await sharedPreferences.setString(
        "remote-dns-domain-strategy",
        _domainStrategyMapper(remoteDomainStrategy),
      );
    }

    if (sharedPreferences.getString("direct-domain-dns-strategy")
        case final String directDomainStrategy) {
      loggy.debug(
        "changing [direct-domain-dns-strategy] = [$directDomainStrategy] to [direct-dns-domain-strategy] = [${_domainStrategyMapper(directDomainStrategy)}]",
      );
      await sharedPreferences.remove("direct-domain-dns-strategy");
      await sharedPreferences.setString(
        "direct-dns-domain-strategy",
        _domainStrategyMapper(directDomainStrategy),
      );
    }

    if (sharedPreferences.getInt("localDns-port") case final int localDnsPort) {
      loggy.debug("changing [localDns-port] to [local-dns-port]");
      await sharedPreferences.remove("localDns-port");
      await sharedPreferences.setInt("local-dns-port", localDnsPort);
    }

    await sharedPreferences.remove("execute-config-as-is");
    await sharedPreferences.remove("enable-tun");
    await sharedPreferences.remove("set-system-proxy");

    await sharedPreferences.remove("cron_profiles_update");
  }

  // Maps old domain strategy values to new ones (IPv6 options become auto)
  String _domainStrategyMapper(String persisted) => switch (persisted) {
        "ipv4_only" || "prefer_ipv4" => persisted,
        "preferIpv4" => "prefer_ipv4",
        "ipv4Only" => "ipv4_only",
        // IPv6 options are no longer supported, use auto
        "ipv6_only" || "prefer_ipv6" || "preferIpv6" || "ipv6Only" => "",
        "auto" => "",
        _ => "",
      };
}
