import 'package:flutter/material.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/features/config_option/data/config_option_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Shows which core engine is active (sing-box or Xray)
class CoreIndicator extends HookConsumerWidget {
  const CoreIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider);
    final theme = Theme.of(context);
    final useXray = ref.watch(ConfigOptions.useXrayCoreWhenPossible);

    final coreName = useXray ? "Xray" : "sing-box";
    final coreColor = useXray
        ? theme.colorScheme.tertiary
        : theme.colorScheme.primary;

    return Semantics(
      label: "${t.config.core}: $coreName",
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: coreColor.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: coreColor.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              useXray ? Icons.bolt : Icons.speed,
              size: 14,
              color: coreColor,
            ),
            const SizedBox(width: 4),
            Text(
              coreName,
              style: theme.textTheme.labelSmall?.copyWith(
                color: coreColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
