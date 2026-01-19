import 'package:flutter/material.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A small icon that indicates a setting requires reconnection to take effect.
/// Shows a sync icon with a tooltip explaining the behavior.
class ReconnectIndicator extends ConsumerWidget {
  const ReconnectIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider);
    return Tooltip(
      message: t.config.requiresReconnectTooltip,
      child: Icon(
        Icons.sync,
        size: 16,
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.7),
      ),
    );
  }
}

/// A wrapper widget that adds the reconnect indicator to a title row.
class TitleWithReconnect extends ConsumerWidget {
  const TitleWithReconnect({
    super.key,
    required this.title,
    this.helpTooltip,
  });

  final String title;
  final String? helpTooltip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Flexible(child: Text(title)),
        const SizedBox(width: 4),
        const ReconnectIndicator(),
        if (helpTooltip case final tooltip?) ...[
          const SizedBox(width: 4),
          Tooltip(
            message: tooltip,
            child: Icon(
              Icons.help_outline,
              size: 16,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }
}
