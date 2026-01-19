import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/core/model/failures.dart';
import 'package:hiddify/features/common/nested_app_bar.dart';
import 'package:hiddify/features/proxy/model/proxy_entity.dart';
import 'package:hiddify/features/proxy/model/proxy_failure.dart';
import 'package:hiddify/features/proxy/overview/proxies_overview_notifier.dart';
import 'package:hiddify/features/proxy/widget/proxy_tile.dart';
import 'package:hiddify/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProxiesOverviewPage extends HookConsumerWidget with PresLogger {
  const ProxiesOverviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider);

    final asyncProxies = ref.watch(proxiesOverviewProvider);
    final notifier = ref.watch(proxiesOverviewProvider.notifier);
    final sortBy = ref.watch(proxiesSortProvider);

    final selectActiveProxyMutation = useMutation(
      initialOnFailure: (error) =>
          CustomToast.error(t.presentShortError(error)).show(context),
    );

    // Build AppBar with test button when proxies are loaded
    Widget buildAppBar({String? groupTag}) => NestedAppBar(
      title: Text(t.proxies.pageTitle),
      actions: [
        // Test all servers button in AppBar for better visibility
        if (groupTag != null)
          IconButton(
            icon: const Icon(FluentIcons.flash_24_regular),
            tooltip: t.proxies.delayTestTooltip,
            onPressed: () => notifier.urlTest(groupTag),
          ),
        PopupMenuButton<ProxiesSort>(
          initialValue: sortBy,
          onSelected: ref.read(proxiesSortProvider.notifier).update,
          icon: const Icon(FluentIcons.arrow_sort_24_regular),
          tooltip: t.proxies.sortTooltip,
          itemBuilder: (context) {
            return [
              ...ProxiesSort.values.map(
                (e) => PopupMenuItem(
                  value: e,
                  child: Text(e.present(t)),
                ),
              ),
            ];
          },
        ),
      ],
    );

    final appBar = buildAppBar();

    switch (asyncProxies) {
      case AsyncData(value: final groups):
        if (groups.isEmpty) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                appBar,
                SliverFillRemaining(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(t.proxies.emptyProxiesMsg),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        // Find the primary group for proxy selection (usually "Select" or first selector)
        final primaryGroup = groups.firstWhere(
          (g) => g.tag == 'Select' || g.tag == 'select',
          orElse: () => groups.first,
        );

        // Combine all proxies from all groups into a single list
        final allProxies = <ProxyItemEntity>[];
        String? testGroupTag;

        for (final group in groups) {
          // Use first group for URL testing
          testGroupTag ??= group.tag;

          // Add all items, avoiding duplicates by tag
          for (final item in group.items) {
            if (!allProxies.any((p) => p.tag == item.tag)) {
              allProxies.add(item);
            }
          }
        }

        // Only show selected from primary group (not from all groups)
        final selectedTag = primaryGroup.selected;

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              buildAppBar(groupTag: testGroupTag),
              SliverLayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.crossAxisExtent;
                  if (!PlatformUtils.isDesktop && width < 648) {
                    return SliverPadding(
                      padding: const EdgeInsets.only(bottom: 86),
                      sliver: SliverList.builder(
                        itemBuilder: (_, index) {
                          final proxy = allProxies[index];
                          return ProxyTile(
                            proxy,
                            selected: proxy.tag == selectedTag,
                            onSelect: () {
                              if (selectActiveProxyMutation
                                  .state.isInProgress) {
                                return;
                              }
                              selectActiveProxyMutation.setFuture(
                                notifier.changeProxy(primaryGroup.tag, proxy.tag),
                              );
                            },
                          );
                        },
                        itemCount: allProxies.length,
                      ),
                    );
                  }

                  return SliverGrid.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: (width / 268).floor(),
                      mainAxisExtent: 68,
                    ),
                    itemBuilder: (context, index) {
                      final proxy = allProxies[index];
                      return ProxyTile(
                        proxy,
                        selected: proxy.tag == selectedTag,
                        onSelect: () {
                          if (selectActiveProxyMutation.state.isInProgress) {
                            return;
                          }
                          selectActiveProxyMutation.setFuture(
                            notifier.changeProxy(
                              primaryGroup.tag,
                              proxy.tag,
                            ),
                          );
                        },
                      );
                    },
                    itemCount: allProxies.length,
                  );
                },
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => notifier.urlTest(testGroupTag ?? 'auto'),
            tooltip: t.proxies.delayTestTooltip,
            child: const Icon(FluentIcons.flash_24_filled),
          ),
        );

      case AsyncError(:final error):
        // If service is not running, show empty state instead of error
        if (error is ServiceNotRunning) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                appBar,
                SliverFillRemaining(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(t.proxies.emptyProxiesMsg),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              appBar,
              SliverErrorBodyPlaceholder(
                t.presentShortError(error),
                icon: null,
              ),
            ],
          ),
        );

      case _:
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              appBar,
              const SliverLoadingBodyPlaceholder(),
            ],
          ),
        );
    }
  }
}
