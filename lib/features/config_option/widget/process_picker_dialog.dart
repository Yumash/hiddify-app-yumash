import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/singbox/model/running_process.dart';
import 'package:hiddify/singbox/service/singbox_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Dialog for selecting processes to exclude from VPN
/// Supports both picking from running processes and manual input
class ProcessPickerDialog extends HookConsumerWidget {
  const ProcessPickerDialog({
    super.key,
    required this.initialValue,
    this.onReset,
  });

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

    final tabController = useTabController(initialLength: 2);
    final searchController = useTextEditingController();
    final searchQuery = useState('');

    // Parse initial value into set of selected process names
    final initialProcesses = initialValue
        .split(',')
        .map((e) => e.trim().toLowerCase())
        .where((e) => e.isNotEmpty)
        .toSet();
    final selectedProcesses = useState<Set<String>>(initialProcesses);

    // Manual input controller
    final displayValue = initialValue
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .join('\n');
    final manualController = useTextEditingController(text: displayValue);

    // Fetch running processes
    final processesAsync = useState<AsyncSnapshot<List<RunningProcess>>>(
      const AsyncSnapshot.waiting(),
    );

    Future<void> loadProcesses() async {
      processesAsync.value = const AsyncSnapshot.waiting();
      final result = await SingboxService().listRunningProcesses().run();
      result.fold(
        (error) => processesAsync.value = AsyncSnapshot.withError(
          ConnectionState.done,
          error,
        ),
        (data) => processesAsync.value = AsyncSnapshot.withData(
          ConnectionState.done,
          data,
        ),
      );
    }

    useEffect(
      () {
        loadProcesses();
        return null;
      },
      [],
    );

    // Sync manual input when switching tabs
    useEffect(
      () {
        void listener() {
          if (tabController.index == 1) {
            // Switching to manual tab - update text from selection
            final text = selectedProcesses.value.join('\n');
            if (text.isNotEmpty) {
              manualController.text = text;
            }
          }
        }
        tabController.addListener(listener);
        return () => tabController.removeListener(listener);
      },
      [tabController],
    );

    return AlertDialog(
      title: Text(t.config.excludedProcesses),
      contentPadding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      content: SizedBox(
        width: 400,
        height: 400,
        child: Column(
          children: [
            TabBar(
              controller: tabController,
              tabs: [
                Tab(text: t.config.processPickerTabSelect),
                Tab(text: t.config.processPickerTabManual),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  // Tab 1: Select from list
                  _buildProcessList(
                    context,
                    ref,
                    processesAsync.value,
                    searchController,
                    searchQuery,
                    selectedProcesses,
                    loadProcesses,
                  ),
                  // Tab 2: Manual input
                  _buildManualInput(context, ref, manualController),
                ],
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
            final String result;
            if (tabController.index == 0) {
              // From selection
              result = selectedProcesses.value.join(',');
            } else {
              // From manual input
              result = manualController.text
                  .split('\n')
                  .map((e) => e.trim())
                  .where((e) => e.isNotEmpty)
                  .join(',');
            }
            Navigator.of(context).pop(result);
          },
          child: Text(localizations.okButtonLabel.toUpperCase()),
        ),
      ],
    );
  }

  Widget _buildProcessList(
    BuildContext context,
    WidgetRef ref,
    AsyncSnapshot<List<RunningProcess>> snapshot,
    TextEditingController searchController,
    ValueNotifier<String> searchQuery,
    ValueNotifier<Set<String>> selectedProcesses,
    VoidCallback onRefresh,
  ) {
    final t = ref.watch(translationsProvider);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: t.config.processPickerSearch,
                    prefixIcon: const Icon(Icons.search, size: 20),
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  onChanged: (v) => searchQuery.value = v.toLowerCase(),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: onRefresh,
                icon: const Icon(Icons.refresh),
                tooltip: t.config.processPickerRefresh,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: _buildProcessListContent(
              context,
              ref,
              snapshot,
              searchQuery.value,
              selectedProcesses,
            ),
          ),
          if (selectedProcesses.value.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                '${t.config.processPickerSelected}: ${selectedProcesses.value.length}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildProcessListContent(
    BuildContext context,
    WidgetRef ref,
    AsyncSnapshot<List<RunningProcess>> snapshot,
    String searchQuery,
    ValueNotifier<Set<String>> selectedProcesses,
  ) {
    final t = ref.watch(translationsProvider);

    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 8),
            Text(
              t.config.processPickerError,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              snapshot.error.toString(),
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    final processes = snapshot.data ?? [];
    final runningNames = processes.map((p) => p.name.toLowerCase()).toSet();

    // Find selected processes that are not currently running
    final inactiveSelected = selectedProcesses.value
        .where((name) => !runningNames.contains(name))
        .toList()
      ..sort();

    // Build combined list: inactive selected + running processes
    final List<_ProcessItem> items = [];

    // Add inactive selected processes first (if match search)
    for (final name in inactiveSelected) {
      if (searchQuery.isEmpty || name.contains(searchQuery)) {
        items.add(_ProcessItem(name: name, isRunning: false));
      }
    }

    // Add running processes
    for (final process in processes) {
      if (searchQuery.isEmpty ||
          process.name.toLowerCase().contains(searchQuery)) {
        items.add(_ProcessItem(name: process.name, isRunning: true));
      }
    }

    if (items.isEmpty && processes.isEmpty) {
      return Center(
        child: Text(t.config.processPickerEmpty),
      );
    }

    // Sort: selected first, then by running status, then alphabetically
    items.sort((a, b) {
      final aSelected = selectedProcesses.value.contains(a.name.toLowerCase());
      final bSelected = selectedProcesses.value.contains(b.name.toLowerCase());
      if (aSelected && !bSelected) return -1;
      if (!aSelected && bSelected) return 1;
      // Both selected or both not selected - sort by running status
      if (aSelected && bSelected) {
        if (a.isRunning && !b.isRunning) return -1;
        if (!a.isRunning && b.isRunning) return 1;
      }
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final isSelected = selectedProcesses.value.contains(
          item.name.toLowerCase(),
        );

        return CheckboxListTile(
          value: isSelected,
          title: Row(
            children: [
              Expanded(
                child: Text(
                  item.name,
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 13,
                    color: item.isRunning
                        ? null
                        : Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              if (!item.isRunning)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    t.config.processNotRunning,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ),
            ],
          ),
          dense: true,
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (checked) {
            final newSet = Set<String>.from(selectedProcesses.value);
            if (checked == true) {
              newSet.add(item.name.toLowerCase());
            } else {
              newSet.remove(item.name.toLowerCase());
            }
            selectedProcesses.value = newSet;
          },
        );
      },
    );
  }

  Widget _buildManualInput(
    BuildContext context,
    WidgetRef ref,
    TextEditingController controller,
  ) {
    final t = ref.watch(translationsProvider);
    final hintColor = Theme.of(context).colorScheme.onSurfaceVariant;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.config.excludedProcessesHint,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: TextField(
              controller: controller,
              maxLines: null,
              minLines: 10,
              textDirection: TextDirection.ltr,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: t.config.exclusionListHint,
                hintStyle: TextStyle(
                  color: hintColor.withValues(alpha: 0.5),
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
    );
  }
}

/// Widget tile that opens ProcessPickerDialog
class ProcessPickerTile extends HookConsumerWidget {
  const ProcessPickerTile({
    super.key,
    required this.value,
    required this.onChanged,
    this.onReset,
  });

  final String value;
  final ValueChanged<String> onChanged;
  final VoidCallback? onReset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider);
    final itemCount = value.isEmpty
        ? 0
        : value.split(',').where((e) => e.trim().isNotEmpty).length;

    return ListTile(
      title: Text(t.config.excludedProcesses),
      subtitle: Text(
        value.isEmpty
            ? t.config.excludedProcessesHint
            : '$itemCount ${_getItemWord(itemCount, ref)}',
      ),
      trailing: const Icon(Icons.edit_outlined),
      onTap: () async {
        final result = await ProcessPickerDialog(
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
    if (count == 1) return t.config.exclusionItemSingular;
    return t.config.exclusionItemPlural;
  }
}

/// Helper class for process list items
class _ProcessItem {
  const _ProcessItem({
    required this.name,
    required this.isRunning,
  });

  final String name;
  final bool isRunning;
}
