import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/core/preferences/general_preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdvancedSettingTiles extends HookConsumerWidget {
  const AdvancedSettingTiles({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider);

    final debug = ref.watch(debugModeProvider);
    final disableMemoryLimit = ref.watch(Preferences.disableMemoryLimit);

    return Column(
      children: [
        SwitchListTile(
          title: Text(t.settings.advanced.memoryLimit),
          subtitle: Text(t.settings.advanced.memoryLimitMsg),
          value: !disableMemoryLimit,
          secondary: const Icon(FluentIcons.developer_board_24_regular),
          onChanged: (value) async {
            await ref.read(Preferences.disableMemoryLimit.notifier).update(!value);
          },
        ),
        SwitchListTile(
          title: Text(t.settings.advanced.debugMode),
          value: debug,
          secondary: const Icon(FluentIcons.window_dev_tools_24_regular),
          onChanged: (value) async {
            if (value) {
              await showDialog<bool>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(t.settings.advanced.debugMode),
                    content: Text(t.settings.advanced.debugModeMsg),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).maybePop(true),
                        child: Text(
                          MaterialLocalizations.of(context).okButtonLabel,
                        ),
                      ),
                    ],
                  );
                },
              );
            }
            await ref.read(debugModeProvider.notifier).update(value);
          },
        ),
      ],
    );
  }
}
