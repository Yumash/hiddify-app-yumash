import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/core/preferences/general_preferences.dart';
import 'package:hiddify/features/auto_start/notifier/auto_start_notifier.dart';
import 'package:hiddify/features/common/general_pref_tiles.dart';
import 'package:hiddify/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GeneralSettingTiles extends HookConsumerWidget {
  const GeneralSettingTiles({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider);

    return Column(
      children: [
        const LocalePrefTile(),
        const ThemeModePrefTile(),
        SwitchListTile(
          title: Text(t.settings.general.autoIpCheck),
          secondary: const Icon(FluentIcons.globe_search_24_regular),
          value: ref.watch(Preferences.autoCheckIp),
          onChanged: ref.read(Preferences.autoCheckIp.notifier).update,
        ),
        if (PlatformUtils.isDesktop) ...[
          const ClosingPrefTile(),
          SwitchListTile(
            title: Text(t.settings.general.autoStart),
            value: ref.watch(autoStartProvider).asData!.value,
            onChanged: (value) async {
              if (value) {
                await ref.read(autoStartProvider.notifier).enable();
              } else {
                await ref.read(autoStartProvider.notifier).disable();
              }
            },
          ),
          SwitchListTile(
            title: Text(t.settings.general.silentStart),
            value: ref.watch(Preferences.silentStart),
            onChanged: (value) async {
              await ref.read(Preferences.silentStart.notifier).update(value);
            },
          ),
        ],
      ],
    );
  }
}
