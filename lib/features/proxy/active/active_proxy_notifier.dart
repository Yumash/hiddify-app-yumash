import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hiddify/core/utils/throttler.dart';
import 'package:hiddify/features/connection/notifier/connection_notifier.dart';
import 'package:hiddify/features/proxy/data/proxy_data_providers.dart';
import 'package:hiddify/features/proxy/model/ip_info_entity.dart';
import 'package:hiddify/features/proxy/model/proxy_entity.dart';
import 'package:hiddify/features/proxy/model/proxy_failure.dart';
import 'package:hiddify/utils/riverpod_utils.dart';
import 'package:hiddify/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'active_proxy_notifier.g.dart';

@riverpod
class IpInfoNotifier extends _$IpInfoNotifier with AppLogger {
  @override
  Future<IpInfo> build() async {
    ref.disposeDelay(const Duration(minutes: 5));
    final cancelToken = CancelToken();
    Timer? refreshTimer;
    ref.onDispose(() {
      loggy.debug("disposing");
      cancelToken.cancel();
      refreshTimer?.cancel();
    });

    final serviceRunning = await ref.watch(serviceRunningProvider.future);
    if (!serviceRunning) {
      throw const ServiceNotRunning();
    }

    final info = await ref.watch(proxyRepositoryProvider).getCurrentIpInfo(cancelToken).getOrElse(
      (err) {
        loggy.warning("error getting proxy ip info", err, StackTrace.current);
        throw const UnknownIp();
      },
    ).run();

    // Auto-refresh IP every 30 seconds while connected
    refreshTimer = Timer(
      const Duration(seconds: 30),
      () {
        loggy.debug("auto-refreshing IP info");
        ref.invalidateSelf();
      },
    );

    return info;
  }

  Future<void> refresh() async {
    if (state.isLoading) return;
    loggy.debug("manual refresh");
    state = const AsyncLoading();
    ref.invalidateSelf();
  }
}

@Riverpod(keepAlive: true)
class ActiveProxyNotifier extends _$ActiveProxyNotifier with AppLogger {
  @override
  Stream<ProxyItemEntity> build() async* {
    // ref.disposeDelay(const Duration(seconds: 20));

    final serviceRunning = await ref.watch(serviceRunningProvider.future);
    if (!serviceRunning) {
      throw const ServiceNotRunning();
    }

    yield* ref
        .watch(proxyRepositoryProvider)
        .watchActiveProxies()
        .map((event) => event.getOrElse((l) => throw l))
        .where((groups) => groups.isNotEmpty)
        .map((groups) {
      loggy.debug("watchActiveProxies groups: ${groups.length}");
      // Find primary group (Select or first)
      final group = groups.firstWhere(
        (g) => g.tag == 'Select' || g.tag == 'select',
        orElse: () => groups.first,
      );
      loggy.debug("Found group: ${group.tag}, selected: ${group.selected}, items: ${group.items.length}");
      // Find selected proxy in the group by group.selected
      final selectedProxyTag = group.selected;
      final selectedProxy = group.items.firstWhere(
        (item) => item.tag == selectedProxyTag,
        orElse: () => group.items.first,
      );
      loggy.debug("Selected proxy: tag=${selectedProxy.tag}, name=${selectedProxy.name}, selectedName=${selectedProxy.selectedName}");
      // Return the selected proxy - use selectedName if available (for selector groups)
      return selectedProxy;
    });
  }

  final _urlTestThrottler = Throttler(const Duration(seconds: 2));

  Future<void> urlTest(String groupTag_) async {
    final groupTag = groupTag_;
    _urlTestThrottler(
      () async {
        if (state case AsyncData()) {
          await ref.read(proxyRepositoryProvider).urlTest(groupTag).getOrElse((err) {
            loggy.warning("error testing group", err);
            throw err;
          }).run();
        }
      },
    );
  }
}
