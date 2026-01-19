import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/core/notification/in_app_notification_controller.dart';
import 'package:hiddify/features/common/nested_app_bar.dart';
import 'package:hiddify/features/config_option/data/config_option_repository.dart';
import 'package:hiddify/features/config_option/widget/preference_tile.dart';
import 'package:hiddify/singbox/service/singbox_service_provider.dart';
import 'package:hiddify/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

class WireGuardServerPage extends HookConsumerWidget {
  const WireGuardServerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider);
    final isEnabled = ref.watch(ConfigOptions.wgServerEnabled);
    final port = ref.watch(ConfigOptions.wgServerPort);
    final subnet = ref.watch(ConfigOptions.wgServerSubnet);

    // LAN IP state
    final lanIp = useState<String?>(null);
    final isLoadingIp = useState(false);

    // Load LAN IP on mount
    useEffect(
      () {
        _loadLanIP(ref, lanIp, isLoadingIp);
        return null;
      },
      [],
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NestedAppBar(
            title: Text(t.config.wgServer.title),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Enable toggle
                  Card(
                    child: SwitchListTile(
                      title: Text(t.config.wgServer.enable),
                      subtitle: Text(t.config.wgServer.enableHint),
                      value: isEnabled,
                      onChanged: (value) async {
                        // If enabling and no keys, generate them first
                        if (value) {
                          final serverPublicKey = ref.read(ConfigOptions.wgServerPublicKey);
                          if (serverPublicKey.isEmpty) {
                            await _generateKeys(ref, context);
                          }
                        }
                        ref.read(ConfigOptions.wgServerEnabled.notifier).update(value);
                      },
                    ),
                  ),
                  const Gap(16),

                  // Settings
                  Card(
                    child: Column(
                      children: [
                        ValuePreferenceWidget(
                          value: port,
                          preferences: ref.watch(ConfigOptions.wgServerPort.notifier),
                          title: t.config.wgServer.port,
                          inputToValue: int.tryParse,
                          digitsOnly: true,
                          validateInput: isPort,
                        ),
                        const Divider(height: 1),
                        ValuePreferenceWidget(
                          value: subnet,
                          preferences: ref.watch(ConfigOptions.wgServerSubnet.notifier),
                          title: t.config.wgServer.subnet,
                        ),
                      ],
                    ),
                  ),
                  const Gap(16),

                  // QR Code section (only when enabled)
                  if (isEnabled) ...[
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: _WireGuardQRSection(
                          port: port,
                          subnet: subnet,
                          lanIp: lanIp.value,
                          onRefreshIp: () => _loadLanIP(ref, lanIp, isLoadingIp),
                          onRegenerateKeys: () => _generateKeys(ref, context),
                        ),
                      ),
                    ),
                  ] else ...[
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Icon(
                              Icons.qr_code_2,
                              size: 64,
                              color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                            ),
                            const Gap(8),
                            Text(
                              t.config.wgServer.enableToShowQR,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],

                  const Gap(16),

                  // Warning card
                  Card(
                    color: Theme.of(context).colorScheme.errorContainer.withValues(alpha: 0.3),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.warning_amber_rounded,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          const Gap(12),
                          Expanded(
                            child: Text(
                              t.config.wgServer.securityWarning,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _loadLanIP(
    WidgetRef ref,
    ValueNotifier<String?> lanIp,
    ValueNotifier<bool> isLoading,
  ) async {
    isLoading.value = true;
    final result = await ref.read(singboxServiceProvider).getLocalLanIP().run();
    result.fold(
      (error) {
        lanIp.value = '?.?.?.?';
      },
      (info) {
        lanIp.value = info.lanIp;
      },
    );
    isLoading.value = false;
  }

  Future<void> _generateKeys(WidgetRef ref, BuildContext context) async {
    final t = ref.read(translationsProvider);

    final result = await ref.read(singboxServiceProvider).generateWireGuardKeys().run();
    result.fold(
      (error) {
        ref.read(inAppNotificationControllerProvider).showErrorToast(error);
      },
      (keys) {
        // Save keys to preferences
        ref.read(ConfigOptions.wgServerPrivateKey.notifier).update(keys.serverPrivateKey);
        ref.read(ConfigOptions.wgServerPublicKey.notifier).update(keys.serverPublicKey);
        ref.read(ConfigOptions.wgClientPrivateKey.notifier).update(keys.clientPrivateKey);
        ref.read(ConfigOptions.wgClientPublicKey.notifier).update(keys.clientPublicKey);
        ref.read(inAppNotificationControllerProvider).showSuccessToast(t.config.wgServer.keysGenerated);
      },
    );
  }
}

class _WireGuardQRSection extends ConsumerWidget {
  const _WireGuardQRSection({
    required this.port,
    required this.subnet,
    required this.lanIp,
    required this.onRefreshIp,
    required this.onRegenerateKeys,
  });

  final int port;
  final String subnet;
  final String? lanIp;
  final VoidCallback onRefreshIp;
  final VoidCallback onRegenerateKeys;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider);

    // Get keys from preferences
    final serverPublicKey = ref.watch(ConfigOptions.wgServerPublicKey);
    final clientPrivateKey = ref.watch(ConfigOptions.wgClientPrivateKey);

    // If keys not generated yet, show generate button
    if (serverPublicKey.isEmpty || clientPrivateKey.isEmpty) {
      return Column(
        children: [
          Icon(
            Icons.vpn_key_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.primary,
          ),
          const Gap(16),
          Text(
            t.config.wgServer.noKeys,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const Gap(16),
          FilledButton.icon(
            onPressed: onRegenerateKeys,
            icon: const Icon(Icons.refresh),
            label: Text(t.config.wgServer.generateKeys),
          ),
        ],
      );
    }

    // Generate client config
    final clientConfig = _generateClientConfig(ref);
    final displayIp = lanIp ?? '?.?.?.?';

    return Column(
      children: [
        // QR Code
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: QrImageView(
            data: clientConfig,
            size: 250,
            backgroundColor: Colors.white,
            errorCorrectionLevel: QrErrorCorrectLevel.M,
          ),
        ),
        const Gap(16),

        // Instructions
        Text(
          t.config.wgServer.scanInstructions,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const Gap(16),

        // Server info
        _InfoRow(
          label: t.config.wgServer.serverAddress,
          value: displayIp,
          onTap: onRefreshIp,
        ),
        _InfoRow(
          label: t.config.wgServer.port,
          value: port.toString(),
        ),
        const Gap(16),

        // Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.icon(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: clientConfig));
                ref.read(inAppNotificationControllerProvider).showSuccessToast(
                      t.general.clipboardExportSuccessMsg,
                    );
              },
              icon: const Icon(Icons.copy),
              label: Text(t.config.wgServer.copyConfig),
            ),
            const Gap(8),
            OutlinedButton.icon(
              onPressed: onRegenerateKeys,
              icon: const Icon(Icons.refresh),
              label: Text(t.config.wgServer.regenerateKeys),
            ),
          ],
        ),
      ],
    );
  }

  String _generateClientConfig(WidgetRef ref) {
    final serverPublicKey = ref.watch(ConfigOptions.wgServerPublicKey);
    final clientPrivateKey = ref.watch(ConfigOptions.wgClientPrivateKey);
    final dns = ref.watch(ConfigOptions.remoteDnsAddress);

    final clientIP = _getClientIP(subnet);
    final displayIp = lanIp ?? '?.?.?.?';
    final cleanDns = _cleanDnsAddress(dns);

    return '''
[Interface]
PrivateKey = $clientPrivateKey
Address = $clientIP/32
DNS = $cleanDns

[Peer]
PublicKey = $serverPublicKey
AllowedIPs = 0.0.0.0/0
Endpoint = $displayIp:$port
PersistentKeepalive = 25
'''.trim();
  }

  String _cleanDnsAddress(String dns) {
    var cleanDns = dns;
    // Remove protocol prefix
    if (cleanDns.contains('://')) {
      cleanDns = cleanDns.split('://')[1];
    }
    // Remove path
    if (cleanDns.contains('/')) {
      cleanDns = cleanDns.split('/')[0];
    }
    return cleanDns.isEmpty ? '8.8.8.8' : cleanDns;
  }

  String _getClientIP(String subnet) {
    // Parse subnet like "10.10.0.0/24" and return ".2" address
    try {
      final parts = subnet.split('/')[0].split('.');
      if (parts.length == 4) {
        parts[3] = '2'; // Client gets .2
        return parts.join('.');
      }
    } catch (e) {
      if (kDebugMode) debugPrint('WireGuard: Failed to parse subnet $subnet: $e');
    }
    return '10.10.0.2';
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
    this.onTap,
  });

  final String label;
  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$label: ',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.bold,
                    ),
              ),
              if (onTap != null) ...[
                const Gap(4),
                Icon(
                  Icons.refresh,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
