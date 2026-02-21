import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/features/connection/notifier/connection_notifier.dart';
import 'package:hiddify/features/proxy/active/active_proxy_notifier.dart';
import 'package:hiddify/features/proxy/active/ip_widget.dart';
import 'package:hiddify/features/stats/notifier/stats_notifier.dart';
import 'package:hiddify/utils/number_formatters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Compact stats widget for home page - shows IP and traffic
class HomeStatsWidget extends HookConsumerWidget {
  const HomeStatsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider);
    final theme = Theme.of(context);

    final serviceRunning = ref.watch(serviceRunningProvider);
    if (serviceRunning case AsyncData(value: false) || AsyncError() || AsyncLoading()) {
      return const SizedBox.shrink();
    }

    final ipInfo = ref.watch(ipInfoProvider);
    final stats = ref.watch(statsProvider).asData?.value;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // IP row with refresh button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FluentIcons.globe_20_regular, size: 18, color: theme.colorScheme.onSurfaceVariant),
              const Gap(8),
              switch (ipInfo) {
                AsyncData(value: final info) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IPCountryFlag(countryCode: info.countryCode, size: 16),
                      const Gap(6),
                      Text(info.ip, style: theme.textTheme.bodyMedium),
                    ],
                  ),
                AsyncLoading() => const SizedBox(
                    width: 14,
                    height: 14,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                _ => Text(t.proxies.unknownIp, style: theme.textTheme.bodyMedium),
              },
              const Gap(8),
              // Refresh button
              InkWell(
                onTap: () => ref.read(ipInfoProvider.notifier).refresh(),
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    FluentIcons.arrow_sync_20_regular,
                    size: 16,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          const Gap(8),
          // Traffic row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Download speed
              Icon(
                FluentIcons.arrow_download_20_regular,
                size: 16,
                color: theme.colorScheme.primary,
              ),
              const Gap(4),
              Text(
                (stats?.downlink ?? 0).speed(),
                style: theme.textTheme.bodyMedium,
              ),
              const Gap(16),
              // Upload speed
              Icon(
                FluentIcons.arrow_upload_20_regular,
                size: 16,
                color: theme.colorScheme.secondary,
              ),
              const Gap(4),
              Text(
                (stats?.uplink ?? 0).speed(),
                style: theme.textTheme.bodyMedium,
              ),
              const Gap(16),
              // Total traffic
              Icon(
                FluentIcons.arrow_bidirectional_up_down_20_regular,
                size: 16,
                color: theme.colorScheme.tertiary,
              ),
              const Gap(4),
              Text(
                (stats?.downlinkTotal ?? 0).size(),
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
