import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/features/config_option/widget/reconnect_indicator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Validates URL format for rule-set files
/// Returns null if valid, error message if invalid
/// Note: Validates URL format only. Content format (.srs) is validated
/// by sing-box when fetching the rule-set.
String? validateRuleSetUrl(String url, TranslationsEn t) {
  final trimmedUrl = url.trim();
  if (trimmedUrl.isEmpty) return null; // Empty is OK

  // Check basic URL format
  final uri = Uri.tryParse(trimmedUrl);
  if (uri == null || !uri.hasScheme) {
    return t.config.ruleSetUrlInvalid;
  }

  // Must be http or https
  if (uri.scheme != 'http' && uri.scheme != 'https') {
    return t.config.ruleSetUrlInvalid;
  }

  // Must have a path
  if (uri.path.isEmpty || uri.path == '/') {
    return t.config.ruleSetUrlInvalid;
  }

  // Warn if doesn't end with .srs (but allow it)
  if (!trimmedUrl.toLowerCase().endsWith('.srs')) {
    return t.config.ruleSetUrlMustEndWithSrs;
  }

  return null;
}

/// Dialog for editing exclusion lists (domains or IPs)
/// Supports multiline input with one item per line
class ExclusionListDialog extends HookConsumerWidget {
  const ExclusionListDialog({
    super.key,
    required this.title,
    required this.hint,
    required this.initialValue,
    this.onReset,
  });

  final String title;
  final String hint;
  final String initialValue;
  final VoidCallback? onReset;

  Future<String?> show(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (context) => this,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider);
    final localizations = MaterialLocalizations.of(context);

    // Convert comma-separated to newline-separated for display
    final displayValue = initialValue.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).join('\n');

    final textController = useTextEditingController(text: displayValue);

    return AlertDialog(
      title: Text(title),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hint,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 12),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 200,
                minHeight: 100,
              ),
              child: TextField(
                controller: textController,
                maxLines: null,
                minLines: 5,
                textDirection: TextDirection.ltr,
                autofocus: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: t.config.exclusionListHint,
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                  ),
                ),
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        if (onReset != null)
          TextButton(
            onPressed: () {
              onReset!();
              Navigator.of(context).pop();
            },
            child: Text(t.general.reset.toUpperCase()),
          ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(localizations.cancelButtonLabel.toUpperCase()),
        ),
        TextButton(
          onPressed: () {
            // Convert newline-separated back to comma-separated
            final lines = textController.text
                .split('\n')
                .map((e) => e.trim())
                .where((e) => e.isNotEmpty)
                .join(',');
            Navigator.of(context).pop(lines);
          },
          child: Text(localizations.okButtonLabel.toUpperCase()),
        ),
      ],
    );
  }
}

/// Widget tile that opens ExclusionListDialog
class ExclusionListTile extends HookConsumerWidget {
  const ExclusionListTile({
    super.key,
    required this.title,
    required this.hint,
    required this.value,
    required this.onChanged,
    this.onReset,
    this.emptyText,
  });

  final String title;
  final String hint;
  final String value;
  final ValueChanged<String> onChanged;
  final VoidCallback? onReset;
  final String? emptyText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemCount = value.isEmpty ? 0 : value.split(',').where((e) => e.trim().isNotEmpty).length;

    return ListTile(
      title: Text(title),
      subtitle: Text(
        value.isEmpty
            ? (emptyText ?? '-')
            : '$itemCount ${_getItemWord(itemCount, ref)}',
      ),
      trailing: const Icon(Icons.edit_outlined),
      onTap: () async {
        final result = await ExclusionListDialog(
          title: title,
          hint: hint,
          initialValue: value,
          onReset: onReset,
        ).show(context);

        if (result != null) {
          onChanged(result);
        }
      },
    );
  }

  String _getItemWord(int count, WidgetRef ref) {
    final t = ref.watch(translationsProvider);
    // Simple pluralization
    if (count == 1) return t.config.exclusionItemSingular;
    return t.config.exclusionItemPlural;
  }
}

/// Dialog for editing rule-set URL lists with validation
/// Validates that each URL is a valid HTTP(S) URL ending in .srs
class RuleSetUrlListDialog extends HookConsumerWidget {
  const RuleSetUrlListDialog({
    super.key,
    required this.title,
    required this.hint,
    required this.initialValue,
    this.onReset,
  });

  final String title;
  final String hint;
  final String initialValue;
  final VoidCallback? onReset;

  Future<String?> show(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (context) => this,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider);
    final localizations = MaterialLocalizations.of(context);

    // Convert comma-separated to newline-separated for display
    final displayValue = initialValue.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).join('\n');

    final textController = useTextEditingController(text: displayValue);
    final validationErrors = useState<List<String>>([]);

    void validate() {
      final lines = textController.text.split('\n').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
      final errors = <String>[];
      for (int i = 0; i < lines.length; i++) {
        final error = validateRuleSetUrl(lines[i], t);
        if (error != null) {
          errors.add('${t.config.ruleSetUrlLine} ${i + 1}: $error');
        }
      }
      validationErrors.value = errors;
    }

    return AlertDialog(
      title: Row(
        children: [
          Expanded(child: Text(title)),
          const ReconnectIndicator(),
        ],
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hint,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              t.config.ruleSetUrlFormat,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 12),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 200,
                minHeight: 100,
              ),
              child: TextField(
                controller: textController,
                maxLines: null,
                minLines: 5,
                textDirection: TextDirection.ltr,
                autofocus: true,
                onChanged: (_) => validate(),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'https://example.com/geosite.srs',
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                  ),
                  errorText: validationErrors.value.isNotEmpty ? validationErrors.value.first : null,
                  errorMaxLines: 3,
                ),
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 12,
                ),
              ),
            ),
            if (validationErrors.value.length > 1) ...[
              const SizedBox(height: 8),
              ...validationErrors.value.skip(1).take(2).map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    e,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
              ),
              if (validationErrors.value.length > 3)
                Text(
                  '... ${t.config.ruleSetUrlMoreErrors(count: validationErrors.value.length - 3)}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
            ],
          ],
        ),
      ),
      actions: [
        if (onReset != null)
          TextButton(
            onPressed: () {
              onReset!();
              Navigator.of(context).pop();
            },
            child: Text(t.general.reset.toUpperCase()),
          ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(localizations.cancelButtonLabel.toUpperCase()),
        ),
        TextButton(
          onPressed: validationErrors.value.isNotEmpty
              ? null
              : () {
                  // Convert newline-separated back to comma-separated
                  final lines = textController.text
                      .split('\n')
                      .map((e) => e.trim())
                      .where((e) => e.isNotEmpty)
                      .join(',');
                  Navigator.of(context).pop(lines);
                },
          child: Text(localizations.okButtonLabel.toUpperCase()),
        ),
      ],
    );
  }
}

/// Widget tile that opens RuleSetUrlListDialog with validation
class RuleSetUrlListTile extends HookConsumerWidget {
  const RuleSetUrlListTile({
    super.key,
    required this.title,
    required this.hint,
    required this.value,
    required this.onChanged,
    this.onReset,
    this.emptyText,
  });

  final String title;
  final String hint;
  final String value;
  final ValueChanged<String> onChanged;
  final VoidCallback? onReset;
  final String? emptyText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemCount = value.isEmpty ? 0 : value.split(',').where((e) => e.trim().isNotEmpty).length;

    return ListTile(
      title: TitleWithReconnect(title: title),
      subtitle: Text(
        value.isEmpty ? (emptyText ?? '-') : '$itemCount URL',
      ),
      trailing: const Icon(Icons.edit_outlined),
      onTap: () async {
        final result = await RuleSetUrlListDialog(
          title: title,
          hint: hint,
          initialValue: value,
          onReset: onReset,
        ).show(context);

        if (result != null) {
          onChanged(result);
        }
      },
    );
  }
}
