import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/core/router/router.dart';
import 'package:hiddify/features/config_option/data/config_option_repository.dart';
import 'package:hiddify/features/config_option/overview/config_options_page.dart';
import 'package:hiddify/singbox/model/singbox_config_enum.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuickSettingsModal extends HookConsumerWidget {
  const QuickSettingsModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          // Only show service mode selector if there are multiple choices
          if (ServiceMode.choices.length > 1) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SegmentedButton(
                segments: ServiceMode.choices
                    .map(
                      (e) => ButtonSegment(
                        value: e,
                        label: Text(
                          e.presentShort(t),
                          overflow: TextOverflow.ellipsis,
                        ),
                        tooltip: e.isExperimental ? t.settings.experimental : null,
                      ),
                    )
                    .toList(),
                selected: {ref.watch(ConfigOptions.serviceMode)},
                onSelectionChanged: (newSet) => ref.read(ConfigOptions.serviceMode.notifier).update(newSet.first),
              ),
            ),
            const Gap(8),
          ],
          GestureDetector(
            onLongPress: () {
              ConfigOptionsRoute(section: ConfigOptionSection.fragment.name).go(context);
            },
            child: SwitchListTile(
              value: ref.watch(ConfigOptions.enableTlsFragment),
              onChanged: ref.watch(ConfigOptions.enableTlsFragment.notifier).update,
              title: Text(t.config.enableTlsFragment),
            ),
          ),
          ListTile(
            title: Text(t.config.allOptions),
            trailing: const Icon(FluentIcons.chevron_right_24_regular),
            dense: true,
            onTap: () => const ConfigOptionsRoute().go(context),
          ),
          const Gap(16),
        ],
      ),
    );
  }
}
