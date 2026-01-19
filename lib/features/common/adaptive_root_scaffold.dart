import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/core/router/router.dart';
import 'package:hiddify/features/stats/widget/side_bar_stats_overview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Breakpoint definitions for adaptive layout
/// Note: Windows-only app with minimum window size 900x600
class AdaptiveBreakpoints {
  static const double small = 600;
  static const double medium = 840;
  // Reduced from 1200 to 900 to match minimum window size
  static const double large = 900;

  static bool isSmall(BuildContext context) =>
      MediaQuery.sizeOf(context).width < small;

  static bool isMedium(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= small && width < large;
  }

  static bool isLarge(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= large;
}

abstract interface class RootScaffold {
  static final stateKey = GlobalKey<ScaffoldState>();

  static bool canShowDrawer(BuildContext context) =>
      AdaptiveBreakpoints.isSmall(context);
}

class AdaptiveRootScaffold extends HookConsumerWidget {
  const AdaptiveRootScaffold(this.navigator, {super.key});

  final Widget navigator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider);

    final selectedIndex = getCurrentIndex(context);

    final destinations = [
      NavigationDestination(
        icon: const Icon(FluentIcons.power_20_filled),
        label: t.home.pageTitle,
      ),
      NavigationDestination(
        icon: const Icon(FluentIcons.filter_20_filled),
        label: t.proxies.pageTitle,
      ),
      NavigationDestination(
        icon: const Icon(FluentIcons.box_edit_20_filled),
        label: t.config.pageTitle,
      ),
      NavigationDestination(
        icon: const Icon(FluentIcons.settings_20_filled),
        label: t.settings.pageTitle,
      ),
      NavigationDestination(
        icon: const Icon(FluentIcons.document_text_20_filled),
        label: t.logs.pageTitle,
      ),
      NavigationDestination(
        icon: const Icon(FluentIcons.info_20_filled),
        label: t.about.pageTitle,
      ),
    ];

    return _CustomAdaptiveScaffold(
      selectedIndex: selectedIndex,
      onSelectedIndexChange: (index) {
        RootScaffold.stateKey.currentState?.closeDrawer();
        switchTab(index, context);
      },
      destinations: destinations,
      drawerDestinationRange: (0, null),
      sidebarTrailing: const Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SideBarStatsOverview(),
        ),
      ),
      body: navigator,
    );
  }
}

class _CustomAdaptiveScaffold extends HookConsumerWidget {
  const _CustomAdaptiveScaffold({
    required this.selectedIndex,
    required this.onSelectedIndexChange,
    required this.destinations,
    required this.drawerDestinationRange,
    this.sidebarTrailing,
    required this.body,
  });

  final int selectedIndex;
  final Function(int) onSelectedIndexChange;
  final List<NavigationDestination> destinations;
  final (int, int?) drawerDestinationRange;
  final Widget? sidebarTrailing;
  final Widget body;

  List<NavigationDestination> destinationsSlice((int, int?) range) =>
      destinations.sublist(range.$1, range.$2);

  int? selectedWithOffset((int, int?) range) {
    final index = selectedIndex - range.$1;
    return index < 0 || (range.$2 != null && index > (range.$2! - 1))
        ? null
        : index;
  }

  void selectWithOffset(int index, (int, int?) range) =>
      onSelectedIndexChange(index + range.$1);

  /// Convert NavigationDestination to NavigationRailDestination
  NavigationRailDestination _toRailDestination(NavigationDestination dest) {
    return NavigationRailDestination(
      icon: dest.icon,
      selectedIcon: dest.selectedIcon,
      label: Text(dest.label),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;

    // During startup, width may be 0 - show loading indicator until window is ready
    if (width == 0) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Windows-only app with minimum 900px width, so always large
    final isSmall = AdaptiveBreakpoints.isSmall(context);
    final isLarge = AdaptiveBreakpoints.isLarge(context);

    // Debug: log window size
    // print('[Scaffold] width=$width height=${size.height} isSmall=$isSmall isLarge=$isLarge');

    return Scaffold(
      key: RootScaffold.stateKey,
      drawer: isSmall
          ? Drawer(
              width: (MediaQuery.sizeOf(context).width * 0.88).clamp(1, 304),
              child: NavigationRail(
                extended: true,
                selectedIndex: selectedWithOffset(drawerDestinationRange),
                destinations: destinationsSlice(drawerDestinationRange)
                    .map(_toRailDestination)
                    .toList(),
                onDestinationSelected: (index) =>
                    selectWithOffset(index, drawerDestinationRange),
              ),
            )
          : null,
      body: Row(
        children: [
          // Navigation Rail for medium and large screens
          if (!isSmall)
            NavigationRail(
              extended: isLarge,
              selectedIndex: selectedIndex,
              destinations: destinations.map(_toRailDestination).toList(),
              onDestinationSelected: onSelectedIndexChange,
              // Show stats overview only when extended (large screens >= 1200px)
              // because Expanded widget requires extended NavigationRail
              trailing: isLarge ? sidebarTrailing : null,
            ),
          // Main content
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: body,
            ),
          ),
        ],
      ),
    );
  }
}
