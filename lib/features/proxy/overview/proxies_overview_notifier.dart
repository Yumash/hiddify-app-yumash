import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/core/preferences/preferences_provider.dart';
import 'package:hiddify/core/utils/preferences_utils.dart';
import 'package:hiddify/features/connection/notifier/connection_notifier.dart';
import 'package:hiddify/features/profile/data/profile_data_providers.dart';
import 'package:hiddify/features/profile/notifier/active_profile_notifier.dart';
import 'package:hiddify/features/proxy/data/proxy_data_providers.dart';
import 'package:hiddify/features/proxy/model/proxy_entity.dart';
import 'package:hiddify/features/proxy/model/proxy_failure.dart';
import 'package:hiddify/utils/riverpod_utils.dart';
import 'package:hiddify/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'proxies_overview_notifier.g.dart';

enum ProxiesSort {
  unsorted,
  name,
  delay;

  String present(TranslationsEn t) => switch (this) {
        ProxiesSort.unsorted => t.proxies.sortOptions.unsorted,
        ProxiesSort.name => t.proxies.sortOptions.name,
        ProxiesSort.delay => t.proxies.sortOptions.delay,
      };
}

@Riverpod(keepAlive: true)
class ProxiesSortNotifier extends _$ProxiesSortNotifier with AppLogger {
  late final _pref = PreferencesEntry(
    preferences: ref.watch(sharedPreferencesProvider).requireValue,
    key: "proxies_sort_mode",
    defaultValue: ProxiesSort.delay,
    mapFrom: ProxiesSort.values.byName,
    mapTo: (value) => value.name,
  );

  @override
  ProxiesSort build() {
    final sortBy = _pref.read();
    loggy.info("sort proxies by: [${sortBy.name}]");
    return sortBy;
  }

  Future<void> update(ProxiesSort value) {
    state = value;
    return _pref.write(value);
  }
}

@riverpod
class ProxiesOverviewNotifier extends _$ProxiesOverviewNotifier with AppLogger {
  @override
  Stream<List<ProxyGroupEntity>> build() async* {
    ref.disposeDelay(const Duration(seconds: 15));

    // First check if there's an active profile - if not, show empty state immediately
    final activeProfile = ref.watch(activeProfileProvider);
    String? profileId;
    switch (activeProfile) {
      case AsyncData(value: null):
        loggy.debug("ProxiesOverviewNotifier: no active profile, throwing ServiceNotRunning");
        throw const ServiceNotRunning();
      case AsyncError():
        loggy.debug("ProxiesOverviewNotifier: active profile error, throwing ServiceNotRunning");
        throw const ServiceNotRunning();
      case AsyncLoading():
        // Profile is still loading - wait for it
        loggy.debug("ProxiesOverviewNotifier: waiting for active profile to load...");
        final profile = await ref.watch(activeProfileProvider.future);
        if (profile == null) {
          loggy.debug("ProxiesOverviewNotifier: no active profile after loading, throwing ServiceNotRunning");
          throw const ServiceNotRunning();
        }
        profileId = profile.id;
      case AsyncData(value: final profile):
        // Profile exists, continue
        profileId = profile?.id;
        break;
    }

    loggy.debug("ProxiesOverviewNotifier: checking serviceRunning...");
    final serviceRunning = await ref.watch(serviceRunningProvider.future);
    loggy.debug("ProxiesOverviewNotifier: serviceRunning=$serviceRunning");
    final sortBy = ref.watch(proxiesSortProvider);

    if (serviceRunning) {
      // VPN is connected - watch live proxies from sing-box
      loggy.debug("ProxiesOverviewNotifier: service is running, watching proxies...");
      yield* ref
          .watch(proxyRepositoryProvider)
          .watchProxies()
          .throttleTime(
            const Duration(milliseconds: 100),
            leading: false,
            trailing: true,
          )
          .map(
            (event) => event.getOrElse(
              (err) {
                loggy.warning("error receiving proxies", err);
                throw err;
              },
            ),
          )
          .asyncMap((proxies) => _sortOutbounds(proxies, sortBy));
    } else {
      // VPN is not connected - read proxies from profile config file
      loggy.debug("ProxiesOverviewNotifier: service not running, reading from file...");
      if (profileId == null) {
        throw const ServiceNotRunning();
      }

      final pathResolver = ref.watch(profilePathResolverProvider);
      final configPath = pathResolver.file(profileId).path;
      loggy.debug("ProxiesOverviewNotifier: reading proxies from $configPath");

      final result = await ref.watch(proxyRepositoryProvider).getProxiesFromFile(configPath).run();
      final proxies = result.getOrElse((err) {
        loggy.warning("error reading proxies from file", err);
        throw err;
      });

      yield await _sortOutbounds(proxies, sortBy);
    }
  }

  Future<List<ProxyGroupEntity>> _sortOutbounds(
    List<ProxyGroupEntity> proxies,
    ProxiesSort sortBy,
  ) async {
    final groupWithSelected = {
      for (final o in proxies) o.tag: o.selected,
    };
    final sortedProxies = <ProxyGroupEntity>[];
    for (final group in proxies) {
      final sortedItems = switch (sortBy) {
        ProxiesSort.name => group.items.sortedWith((a, b) {
            if (a.type.isGroup && !b.type.isGroup) return -1;
            if (!a.type.isGroup && b.type.isGroup) return 1;
            return a.tag.compareTo(b.tag);
          }),
        ProxiesSort.delay => group.items.sortedWith((a, b) {
            if (a.type.isGroup && !b.type.isGroup) return -1;
            if (!a.type.isGroup && b.type.isGroup) return 1;

            final ai = a.urlTestDelay;
            final bi = b.urlTestDelay;
            if (ai == 0 && bi == 0) return -1;
            if (ai == 0 && bi > 0) return 1;
            if (ai > 0 && bi == 0) return -1;
            return ai.compareTo(bi);
          }),
        ProxiesSort.unsorted => group.items,
      };
      final items = <ProxyItemEntity>[];
      for (final item in sortedItems) {
        if (groupWithSelected.keys.contains(item.tag)) {
          items.add(item.copyWith(selectedTag: groupWithSelected[item.tag]));
        } else {
          items.add(item);
        }
      }
      sortedProxies.add(group.copyWith(items: items));
    }
    return sortedProxies;
  }

  Future<void> changeProxy(String groupTag, String outboundTag) async {
    loggy.info(
      "CHANGING PROXY: group=[$groupTag] outbound=[$outboundTag]",
    );
    if (state case AsyncData(value: final outbounds)) {
      loggy.info("Calling selectProxy...");
      final result = await ref.read(proxyRepositoryProvider).selectProxy(groupTag, outboundTag).run();
      result.fold(
        (err) {
          loggy.error("ERROR selecting outbound: $err");
          throw err;
        },
        (_) {
          loggy.info("selectProxy SUCCESS");
        },
      );

      // Update local state - sing-box selector handles hot-switching without reconnect
      state = AsyncData(
        [
          ...outbounds.map(
            (e) => e.tag == groupTag ? e.copyWith(selected: outboundTag) : e,
          ),
        ],
      );
      loggy.info("Proxy selection updated in state");
    } else {
      loggy.warning("changeProxy called but state is not AsyncData");
    }
  }

  Future<void> urlTest(String groupTag) async {
    loggy.debug("testing group: [$groupTag]");
    if (state case AsyncData()) {
      await ref.read(proxyRepositoryProvider).urlTest(groupTag).getOrElse((err) {
        loggy.error("error testing group", err);
        throw err;
      }).run();
    }
  }
}
