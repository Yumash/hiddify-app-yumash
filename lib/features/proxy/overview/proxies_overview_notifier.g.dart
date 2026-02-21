// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proxies_overview_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProxiesSortNotifier)
final proxiesSortProvider = ProxiesSortNotifierProvider._();

final class ProxiesSortNotifierProvider
    extends $NotifierProvider<ProxiesSortNotifier, ProxiesSort> {
  ProxiesSortNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'proxiesSortProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$proxiesSortNotifierHash();

  @$internal
  @override
  ProxiesSortNotifier create() => ProxiesSortNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProxiesSort value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProxiesSort>(value),
    );
  }
}

String _$proxiesSortNotifierHash() =>
    r'cf279518d5aa1b2d039853ef1bc0fe8c21238fd0';

abstract class _$ProxiesSortNotifier extends $Notifier<ProxiesSort> {
  ProxiesSort build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ProxiesSort, ProxiesSort>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProxiesSort, ProxiesSort>,
              ProxiesSort,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ProxiesOverviewNotifier)
final proxiesOverviewProvider = ProxiesOverviewNotifierProvider._();

final class ProxiesOverviewNotifierProvider
    extends
        $StreamNotifierProvider<
          ProxiesOverviewNotifier,
          List<ProxyGroupEntity>
        > {
  ProxiesOverviewNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'proxiesOverviewProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$proxiesOverviewNotifierHash();

  @$internal
  @override
  ProxiesOverviewNotifier create() => ProxiesOverviewNotifier();
}

String _$proxiesOverviewNotifierHash() =>
    r'5ecbcf14796fa32fe5b5a3e6f64a0583f20d3004';

abstract class _$ProxiesOverviewNotifier
    extends $StreamNotifier<List<ProxyGroupEntity>> {
  Stream<List<ProxyGroupEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<ProxyGroupEntity>>, List<ProxyGroupEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<ProxyGroupEntity>>,
                List<ProxyGroupEntity>
              >,
              AsyncValue<List<ProxyGroupEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
