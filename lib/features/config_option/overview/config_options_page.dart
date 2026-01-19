import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/core/model/optional_range.dart';
import 'package:hiddify/core/model/region.dart';
import 'package:hiddify/core/notification/in_app_notification_controller.dart';
import 'package:hiddify/core/router/routes.dart';
import 'package:hiddify/core/widget/adaptive_icon.dart';
import 'package:hiddify/core/widget/tip_card.dart';
import 'package:hiddify/features/common/confirmation_dialogs.dart';
import 'package:hiddify/features/common/nested_app_bar.dart';
import 'package:hiddify/features/config_option/data/config_option_repository.dart';
import 'package:hiddify/features/config_option/notifier/config_option_notifier.dart';
import 'package:hiddify/features/config_option/widget/exclusion_list_dialog.dart';
import 'package:hiddify/features/config_option/widget/preference_tile.dart';
import 'package:hiddify/features/config_option/widget/process_picker_dialog.dart';
import 'package:hiddify/features/config_option/widget/reconnect_indicator.dart';
import 'package:hiddify/features/log/model/log_level.dart';
import 'package:hiddify/features/settings/widgets/sections_widgets.dart';
import 'package:hiddify/features/settings/widgets/settings_input_dialog.dart';
import 'package:hiddify/singbox/model/singbox_config_enum.dart';
import 'package:hiddify/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:humanizer/humanizer.dart';

enum ConfigOptionSection {
  fragment;

  static final _fragmentKey = GlobalKey(debugLabel: "fragment-section-key");

  GlobalKey get key => switch (this) {
        ConfigOptionSection.fragment => _fragmentKey,
      };
}

class ConfigOptionsPage extends HookConsumerWidget {
  ConfigOptionsPage({super.key, String? section}) : section = section != null ? ConfigOptionSection.values.byName(section) : null;

  final ConfigOptionSection? section;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider);
    final scrollController = useScrollController();

    useMemoized(
      () {
        if (section != null) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              final box = section!.key.currentContext?.findRenderObject() as RenderBox?;
              final offset = box?.localToGlobal(Offset.zero);
              if (offset == null) return;
              final height = scrollController.offset + offset.dy - MediaQueryData.fromView(View.of(context)).padding.top - kToolbarHeight;
              scrollController.animateTo(
                height,
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
              );
            },
          );
        }
      },
    );

    String experimental(String txt) {
      return "$txt (${t.settings.experimental})";
    }

    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        shrinkWrap: true,
        slivers: [
          NestedAppBar(
            title: Text(t.config.pageTitle),
            actions: [
              PopupMenuButton(
                icon: Icon(AdaptiveIcon(context).more),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      onTap: () => ref.read(configOptionProvider.notifier).exportJsonToClipboard().then((success) {
                        if (success) {
                          ref.read(inAppNotificationControllerProvider).showSuccessToast(
                                t.general.clipboardExportSuccessMsg,
                              );
                        }
                      }),
                      child: Text(t.settings.exportOptions),
                    ),
                    PopupMenuItem(
                      onTap: () async {
                        final shouldImport = await showConfirmationDialog(
                          context,
                          title: t.settings.importOptions,
                          message: t.settings.importOptionsMsg,
                        );
                        if (shouldImport) {
                          await ref.read(configOptionProvider.notifier).importFromClipboard();
                        }
                      },
                      child: Text(t.settings.importOptions),
                    ),
                    PopupMenuItem(
                      child: Text(t.config.resetBtn),
                      onTap: () async {
                        await ref.read(configOptionProvider.notifier).resetOption();
                      },
                    ),
                  ];
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ChoicePreferenceWidget(
                    selected: ref.watch(ConfigOptions.logLevel),
                    preferences: ref.watch(ConfigOptions.logLevel.notifier),
                    choices: LogLevel.choices,
                    title: t.config.logLevel,
                    presentChoice: (value) => value.name.toUpperCase(),
                  ),

                  const SettingsDivider(),
                  SettingsSection(t.config.section.route),
                  // Region is fixed to Russia (ru) in this fork
                  SwitchListTile(
                    title: TitleWithReconnect(
                      title: t.config.blockAds,
                      helpTooltip: t.config.blockAdsTooltip,
                    ),
                    subtitle: Text(t.config.blockAdsHint),
                    value: ref.watch(ConfigOptions.blockAds),
                    onChanged: ref.watch(ConfigOptions.blockAds.notifier).update,
                  ),
                  if (ref.watch(ConfigOptions.blockAds))
                    RuleSetUrlListTile(
                      title: t.config.blockAdsRuleSetUrls,
                      hint: t.config.blockAdsRuleSetUrlsHint,
                      value: ref.watch(ConfigOptions.blockAdsRuleSetUrls),
                      emptyText: t.config.blockAdsRuleSetUrlsHint,
                      onChanged: (v) => ref.watch(ConfigOptions.blockAdsRuleSetUrls.notifier).update(v),
                      onReset: () => ref.watch(ConfigOptions.blockAdsRuleSetUrls.notifier).reset(),
                    ),
                  SwitchListTile(
                    title: TitleWithReconnect(title: t.config.bypassLan),
                    subtitle: Text(t.config.bypassLanHint),
                    value: ref.watch(ConfigOptions.bypassLan),
                    onChanged: ref.watch(ConfigOptions.bypassLan.notifier).update,
                  ),
                  // LAN bypass IP ranges (editable)
                  if (ref.watch(ConfigOptions.bypassLan))
                    ExclusionListTile(
                      title: t.config.lanBypassIps,
                      hint: t.config.lanBypassIpsHint,
                      value: ref.watch(ConfigOptions.lanBypassIps),
                      emptyText: t.config.lanBypassIpsDefault,
                      onChanged: (v) => ref.watch(ConfigOptions.lanBypassIps.notifier).update(v),
                      onReset: () => ref.watch(ConfigOptions.lanBypassIps.notifier).reset(),
                    ),
                  // Yumash Edition: VPN mode always enabled, show exclusion options
                  ExclusionListTile(
                      title: t.config.excludedDomains,
                      hint: t.config.excludedDomainsHint,
                      value: ref.watch(ConfigOptions.excludedDomains),
                      emptyText: t.config.excludedDomainsHint,
                      onChanged: (v) => ref.watch(ConfigOptions.excludedDomains.notifier).update(v),
                      onReset: () => ref.watch(ConfigOptions.excludedDomains.notifier).reset(),
                    ),
                    ExclusionListTile(
                      title: t.config.excludedIps,
                      hint: t.config.excludedIpsHint,
                      value: ref.watch(ConfigOptions.excludedIps),
                      emptyText: t.config.excludedIpsHint,
                      onChanged: (v) => ref.watch(ConfigOptions.excludedIps.notifier).update(v),
                      onReset: () => ref.watch(ConfigOptions.excludedIps.notifier).reset(),
                    ),
                    ProcessPickerTile(
                      value: ref.watch(ConfigOptions.excludedProcesses),
                      onChanged: (v) => ref.watch(ConfigOptions.excludedProcesses.notifier).update(v),
                      onReset: () => ref.watch(ConfigOptions.excludedProcesses.notifier).reset(),
                    ),
                    SwitchListTile(
                      title: TitleWithReconnect(title: t.config.bypassRussianDomains),
                      subtitle: Text(t.config.bypassRussianDomainsHint),
                      value: ref.watch(ConfigOptions.bypassRussianDomains),
                      onChanged: ref.watch(ConfigOptions.bypassRussianDomains.notifier).update,
                    ),
                    SwitchListTile(
                      title: TitleWithReconnect(title: t.config.bypassRussianIps),
                      subtitle: Text(t.config.bypassRussianIpsHint),
                      value: ref.watch(ConfigOptions.bypassRussianIps),
                      onChanged: ref.watch(ConfigOptions.bypassRussianIps.notifier).update,
                    ),
                    // Collapsible section for custom rule-set URLs
                    ExpansionTile(
                      title: Text(t.config.ruleSetUrlsSection),
                      subtitle: Text(t.config.ruleSetUrlsSectionHint),
                      children: [
                        // Russian geosite URL (shown when bypass Russian domains is enabled)
                        if (ref.watch(ConfigOptions.bypassRussianDomains))
                          ValuePreferenceWidget(
                            value: ref.watch(ConfigOptions.russianGeositeUrl),
                            preferences: ref.watch(ConfigOptions.russianGeositeUrl.notifier),
                            title: t.config.russianGeositeUrl,
                          ),
                        // Russian geoip URL (shown when bypass Russian IPs is enabled)
                        if (ref.watch(ConfigOptions.bypassRussianIps))
                          ValuePreferenceWidget(
                            value: ref.watch(ConfigOptions.russianGeoipUrl),
                            preferences: ref.watch(ConfigOptions.russianGeoipUrl.notifier),
                            title: t.config.russianGeoipUrl,
                          ),
                        // Block ads rule-set URLs (always visible in this section)
                        RuleSetUrlListTile(
                          title: t.config.blockAdsRuleSetUrls,
                          hint: t.config.blockAdsRuleSetUrlsHint,
                          value: ref.watch(ConfigOptions.blockAdsRuleSetUrls),
                          emptyText: t.config.blockAdsRuleSetUrlsHint,
                          onChanged: (v) => ref.watch(ConfigOptions.blockAdsRuleSetUrls.notifier).update(v),
                          onReset: () => ref.watch(ConfigOptions.blockAdsRuleSetUrls.notifier).reset(),
                        ),
                        // Rule-set update interval
                        ListTile(
                          title: TitleWithReconnect(title: t.config.ruleSetUpdateInterval),
                          subtitle: Text(_formatDays(ref.watch(ConfigOptions.ruleSetUpdateInterval).inDays, t)),
                          onTap: () async {
                            final interval = await SettingsSliderDialog(
                              title: t.config.ruleSetUpdateInterval,
                              initialValue: ref.watch(ConfigOptions.ruleSetUpdateInterval).inDays.coerceIn(1, 30).toDouble(),
                              onReset: ref.read(ConfigOptions.ruleSetUpdateInterval.notifier).reset,
                              min: 1,
                              max: 30,
                              divisions: 29,
                              labelGen: (value) => _formatDays(value.toInt(), t),
                            ).show(context);
                            if (interval == null) return;
                            await ref.read(ConfigOptions.ruleSetUpdateInterval.notifier).update(Duration(days: interval.toInt()));
                          },
                        ),
                        // Force update rule-sets button
                        ListTile(
                          leading: const Icon(Icons.refresh),
                          title: TitleWithReconnect(title: t.config.forceUpdateRuleSets),
                          subtitle: Text(t.config.forceUpdateRuleSetsHint),
                          onTap: () async {
                            ref.read(inAppNotificationControllerProvider).showInfoToast(t.config.ruleSetUpdating);
                            // Force update by clearing cache - requires reconnect
                            await ref.read(configOptionProvider.notifier).clearRuleSetCache();
                            ref.read(inAppNotificationControllerProvider).showSuccessToast(t.config.ruleSetUpdated);
                          },
                        ),
                      ],
                    ),
                  const SettingsDivider(),
                  SettingsSection(t.config.section.dns),
                  // DNS explanation for better understanding
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.info_outline, size: 20),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                t.config.section.dnsExplanation,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ValuePreferenceWidget(
                    value: ref.watch(ConfigOptions.remoteDnsAddress),
                    preferences: ref.watch(ConfigOptions.remoteDnsAddress.notifier),
                    title: t.config.remoteDnsAddress,
                  ),
                  ChoicePreferenceWidget(
                    selected: ref.watch(ConfigOptions.remoteDnsDomainStrategy),
                    preferences: ref.watch(ConfigOptions.remoteDnsDomainStrategy.notifier),
                    choices: DomainStrategy.values,
                    title: t.config.remoteDnsDomainStrategy,
                    presentChoice: (value) => value.displayName,
                  ),
                  ValuePreferenceWidget(
                    value: ref.watch(ConfigOptions.directDnsAddress),
                    preferences: ref.watch(ConfigOptions.directDnsAddress.notifier),
                    title: t.config.directDnsAddress,
                  ),
                  ChoicePreferenceWidget(
                    selected: ref.watch(ConfigOptions.directDnsDomainStrategy),
                    preferences: ref.watch(ConfigOptions.directDnsDomainStrategy.notifier),
                    choices: DomainStrategy.values,
                    title: t.config.directDnsDomainStrategy,
                    presentChoice: (value) => value.displayName,
                  ),
                  // DNS routing is always enabled for proper bypass functionality
                  // SwitchListTile(
                  //   title: TitleWithReconnect(title: t.config.enableDnsRouting),
                  //   value: ref.watch(ConfigOptions.enableDnsRouting),
                  //   onChanged: ref.watch(ConfigOptions.enableDnsRouting.notifier).update,
                  // ),
                  // const SettingsDivider(),
                  // SettingsSection(experimental(t.config.section.mux)),
                  // SwitchListTile(
                  //   title: Text(t.config.enableMux),
                  //   value: ref.watch(ConfigOptions.enableMux),
                  //   onChanged:
                  //       ref.watch(ConfigOptions.enableMux.notifier).update,
                  // ),
                  // ChoicePreferenceWidget(
                  //   selected: ref.watch(ConfigOptions.muxProtocol),
                  //   preferences: ref.watch(ConfigOptions.muxProtocol.notifier),
                  //   choices: MuxProtocol.values,
                  //   title: t.config.muxProtocol,
                  //   presentChoice: (value) => value.name,
                  // ),
                  // ValuePreferenceWidget(
                  //   value: ref.watch(ConfigOptions.muxMaxStreams),
                  //   preferences:
                  //       ref.watch(ConfigOptions.muxMaxStreams.notifier),
                  //   title: t.config.muxMaxStreams,
                  //   inputToValue: int.tryParse,
                  //   digitsOnly: true,
                  // ),
                  const SettingsDivider(),
                  SettingsSection(t.config.section.inbound),
                  // Yumash Edition: VPN mode is the only mode, show as info
                  ListTile(
                    title: Text(t.config.serviceMode),
                    subtitle: Text(t.config.serviceModes.tun),
                    leading: const Icon(Icons.vpn_key),
                  ),
                  SwitchListTile(
                    title: TitleWithReconnect(
                      title: t.config.strictRoute,
                      helpTooltip: t.config.strictRouteTooltip,
                    ),
                    subtitle: Text(t.config.strictRouteHint),
                    value: ref.watch(ConfigOptions.strictRoute),
                    onChanged: ref.watch(ConfigOptions.strictRoute.notifier).update,
                  ),
                  // TUN implementation is hardcoded to gvisor (most stable)
                  // ChoicePreferenceWidget(
                  //   selected: ref.watch(ConfigOptions.tunImplementation),
                  //   preferences: ref.watch(ConfigOptions.tunImplementation.notifier),
                  //   choices: TunImplementation.values,
                  //   title: t.config.tunImplementation,
                  //   presentChoice: (value) => value.name,
                  // ),
                  ValuePreferenceWidget(
                    value: ref.watch(ConfigOptions.tunAddress),
                    preferences: ref.watch(ConfigOptions.tunAddress.notifier),
                    title: t.config.tunAddress,
                    subtitle: t.config.tunAddressHint,
                  ),
                  // Network port settings with helpful hints
                  ValuePreferenceWidget(
                    value: ref.watch(ConfigOptions.mixedPort),
                    preferences: ref.watch(ConfigOptions.mixedPort.notifier),
                    title: t.config.mixedPort,
                    subtitle: t.config.mixedPortHint,
                    inputToValue: int.tryParse,
                    digitsOnly: true,
                    validateInput: isPort,
                  ),
                  ValuePreferenceWidget(
                    value: ref.watch(ConfigOptions.tproxyPort),
                    preferences: ref.watch(ConfigOptions.tproxyPort.notifier),
                    title: t.config.tproxyPort,
                    subtitle: t.config.tproxyPortHint,
                    inputToValue: int.tryParse,
                    digitsOnly: true,
                    validateInput: isPort,
                  ),
                  ValuePreferenceWidget(
                    value: ref.watch(ConfigOptions.localDnsPort),
                    preferences: ref.watch(ConfigOptions.localDnsPort.notifier),
                    title: t.config.localDnsPort,
                    subtitle: t.config.localDnsPortHint,
                    inputToValue: int.tryParse,
                    digitsOnly: true,
                    validateInput: isPort,
                  ),
                  ValuePreferenceWidget(
                    value: ref.watch(ConfigOptions.mtu),
                    preferences: ref.watch(ConfigOptions.mtu.notifier),
                    title: t.config.mtu,
                    inputToValue: int.tryParse,
                    digitsOnly: true,
                  ),
                  // Allow connection from LAN removed - use WireGuard server for secure sharing
                  // SwitchListTile(
                  //   title: TitleWithReconnect(
                  //     title: experimental(t.config.allowConnectionFromLan),
                  //   ),
                  //   value: ref.watch(ConfigOptions.allowConnectionFromLan),
                  //   onChanged: ref.read(ConfigOptions.allowConnectionFromLan.notifier).update,
                  // ),
                  // WireGuard LAN Server
                  ListTile(
                    leading: const Icon(Icons.wifi_tethering),
                    title: Text(t.config.wgServer.title),
                    subtitle: Text(
                      ref.watch(ConfigOptions.wgServerEnabled)
                          ? t.config.wgServer.statusEnabled
                          : t.config.wgServer.statusDisabled,
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => const WireGuardServerRoute().go(context),
                  ),
                  const SettingsDivider(),
                  SettingsSection(
                    t.config.section.tlsTricks,
                    key: ConfigOptionSection._fragmentKey,
                  ),
                  SwitchListTile(
                    title: TitleWithReconnect(title: t.config.enableTlsFragment),
                    value: ref.watch(ConfigOptions.enableTlsFragment),
                    onChanged: ref.watch(ConfigOptions.enableTlsFragment.notifier).update,
                  ),
                  ValuePreferenceWidget(
                    value: ref.watch(ConfigOptions.tlsFragmentSize),
                    preferences: ref.watch(ConfigOptions.tlsFragmentSize.notifier),
                    title: t.config.tlsFragmentSize,
                    inputToValue: OptionalRange.tryParse,
                    presentValue: (value) => value.present(t),
                    formatInputValue: (value) => value.format(),
                  ),
                  ValuePreferenceWidget(
                    value: ref.watch(ConfigOptions.tlsFragmentSleep),
                    preferences: ref.watch(ConfigOptions.tlsFragmentSleep.notifier),
                    title: t.config.tlsFragmentSleep,
                    inputToValue: OptionalRange.tryParse,
                    presentValue: (value) => value.present(t),
                    formatInputValue: (value) => value.format(),
                  ),
                  SwitchListTile(
                    title: TitleWithReconnect(title: t.config.enableTlsMixedSniCase),
                    value: ref.watch(ConfigOptions.enableTlsMixedSniCase),
                    onChanged: ref.watch(ConfigOptions.enableTlsMixedSniCase.notifier).update,
                  ),
                  SwitchListTile(
                    title: TitleWithReconnect(title: t.config.enableTlsPadding),
                    value: ref.watch(ConfigOptions.enableTlsPadding),
                    onChanged: ref.watch(ConfigOptions.enableTlsPadding.notifier).update,
                  ),
                  ValuePreferenceWidget(
                    value: ref.watch(ConfigOptions.tlsPaddingSize),
                    preferences: ref.watch(ConfigOptions.tlsPaddingSize.notifier),
                    title: t.config.tlsPaddingSize,
                    inputToValue: OptionalRange.tryParse,
                    presentValue: (value) => value.format(),
                    formatInputValue: (value) => value.format(),
                  ),
                  const SettingsDivider(),
                  SettingsSection(t.config.section.misc),
                  ValuePreferenceWidget(
                    value: ref.watch(ConfigOptions.connectionTestUrl),
                    preferences: ref.watch(ConfigOptions.connectionTestUrl.notifier),
                    title: t.config.connectionTestUrl,
                  ),
                  ListTile(
                    title: Text(t.config.urlTestInterval),
                    subtitle: Text(_formatMinutes(ref.watch(ConfigOptions.urlTestInterval).inMinutes, t)),
                    onTap: () async {
                      final urlTestInterval = await SettingsInputDialog<int>(
                        title: t.config.urlTestInterval,
                        initialValue: ref.watch(ConfigOptions.urlTestInterval).inMinutes.coerceIn(1, 60),
                        digitsOnly: true,
                        mapTo: (value) {
                          final minutes = int.tryParse(value);
                          if (minutes == null || minutes < 1 || minutes > 60) return null;
                          return minutes;
                        },
                        validator: (value) {
                          final minutes = int.tryParse(value);
                          return minutes != null && minutes >= 1 && minutes <= 60;
                        },
                        valueFormatter: (value) => value.toString(),
                        onReset: ref.read(ConfigOptions.urlTestInterval.notifier).reset,
                      ).show(context);
                      if (urlTestInterval == null) return;
                      await ref.read(ConfigOptions.urlTestInterval.notifier).update(Duration(minutes: urlTestInterval));
                    },
                  ),
                  // Xray-core auto-switching is always enabled in this fork
                  const Gap(24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Helper functions for localized time formatting
String _formatDays(int days, TranslationsEn t) {
  if (days == 1) {
    return '1 ${t.config.dayOne}';
  } else if (days >= 2 && days <= 4) {
    return '$days ${t.config.dayFew}';
  } else {
    return '$days ${t.config.dayMany}';
  }
}

String _formatMinutes(int minutes, TranslationsEn t) {
  if (minutes == 1) {
    return '1 ${t.config.minuteOne}';
  } else if (minutes >= 2 && minutes <= 4) {
    return '$minutes ${t.config.minuteFew}';
  } else {
    return '$minutes ${t.config.minuteMany}';
  }
}
