import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hiddify/core/app_info/app_info_provider.dart';
import 'package:hiddify/core/directories/directories_provider.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/core/model/constants.dart';
import 'package:hiddify/core/widget/adaptive_icon.dart';
import 'package:hiddify/features/common/nested_app_bar.dart';
import 'package:hiddify/gen/assets.gen.dart';
import 'package:hiddify/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AboutPage extends HookConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider);
    final appInfo = ref.watch(appInfoProvider).requireValue;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NestedAppBar(
            title: Text(t.about.pageTitle),
            actions: [
              PopupMenuButton(
                icon: Icon(AdaptiveIcon(context).more),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: Text(t.general.addToClipboard),
                      onTap: () {
                        Clipboard.setData(
                          ClipboardData(text: appInfo.format()),
                        );
                      },
                    ),
                  ];
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.images.logo.svg(width: 64, height: 64),
                  const Gap(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Constants.appName,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Gap(4),
                      Text(
                        "v${appInfo.presentVersion}",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ListTile(
                  title: Text(t.settings.general.openWorkingDir),
                  trailing: const Icon(FluentIcons.open_folder_24_regular),
                  onTap: () async {
                    final path =
                        ref.watch(appDirectoriesProvider).requireValue.workingDir.uri;
                    await UriUtils.tryLaunch(path);
                  },
                ),
                const Divider(),
                // Fork modifications info
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            t.about.yumash.title,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(12),
                          Text(
                            '${t.about.yumash.added}:',
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const Gap(4),
                          Text('• ${t.about.yumash.featureDualCore}'),
                          Text('• ${t.about.yumash.featureHiddifyManager}'),
                          Text('• ${t.about.yumash.featureTlsTricks}'),
                          Text('• ${t.about.yumash.featureBypassRu}'),
                          Text('• ${t.about.yumash.featureBlockAds}'),
                          Text('• ${t.about.yumash.featureRulesetCache}'),
                          Text('• ${t.about.yumash.featureProcessPicker}'),
                          Text('• ${t.about.yumash.featureProviderButtons}'),
                          Text('• ${t.about.yumash.featurePortable}'),
                          Text('• ${t.about.yumash.featureTunCgnat}'),
                          const Gap(12),
                          Text(
                            '${t.about.yumash.improved}:',
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                          const Gap(4),
                          Text('• ${t.about.yumash.improvedSingbox}'),
                          Text('• ${t.about.yumash.improvedHotSwitch}'),
                          Text('• ${t.about.yumash.improvedFixedWindow}'),
                          const Gap(12),
                          Text(
                            '${t.about.yumash.removed}:',
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                          const Gap(4),
                          Text('• ${t.about.yumash.removedPlatforms}'),
                          Text('• ${t.about.yumash.removedIpv6}'),
                          Text('• ${t.about.yumash.removedWarp}'),
                          Text('• ${t.about.yumash.removedClash}'),
                          Text('• ${t.about.yumash.removedExtensions}'),
                          Text('• ${t.about.yumash.removedAutoupdate}'),
                          Text('• ${t.about.yumash.removedLocales}'),
                          const Gap(16),
                          Text(
                            '${t.about.yumash.donate}:',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(8),
                          _DonationWallet(
                            label: t.about.yumash.donateBtc,
                            address: Constants.donationBtc,
                          ),
                          const Gap(4),
                          _DonationWallet(
                            label: t.about.yumash.donateUsdt,
                            address: Constants.donationUsdtTrc20,
                          ),
                          const Gap(4),
                          _DonationWallet(
                            label: t.about.yumash.donateTon,
                            address: Constants.donationTon,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  title: Text(t.about.sourceCode),
                  trailing: const Icon(FluentIcons.open_24_regular),
                  onTap: () async {
                    await UriUtils.tryLaunch(
                      Uri.parse(Constants.githubUrl),
                    );
                  },
                ),
                ListTile(
                  title: Text(t.about.originalProject),
                  trailing: const Icon(FluentIcons.open_24_regular),
                  onTap: () async {
                    await UriUtils.tryLaunch(
                      Uri.parse(Constants.originalGithubUrl),
                    );
                  },
                ),
                ListTile(
                  title: Text(t.about.termsAndConditions),
                  trailing: const Icon(FluentIcons.open_24_regular),
                  onTap: () async {
                    await UriUtils.tryLaunch(
                      Uri.parse(Constants.termsAndConditionsUrl),
                    );
                  },
                ),
                ListTile(
                  title: Text(t.about.privacyPolicy),
                  trailing: const Icon(FluentIcons.open_24_regular),
                  onTap: () async {
                    await UriUtils.tryLaunch(
                      Uri.parse(Constants.privacyPolicyUrl),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DonationWallet extends StatelessWidget {
  const _DonationWallet({
    required this.label,
    required this.address,
  });

  final String label;
  final String address;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () {
        Clipboard.setData(ClipboardData(text: address));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$label copied'),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              FluentIcons.copy_24_regular,
              size: 16,
              color: theme.colorScheme.primary,
            ),
            const Gap(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    address,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontFamily: 'monospace',
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
