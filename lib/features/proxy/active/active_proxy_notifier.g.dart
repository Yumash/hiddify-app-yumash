// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_proxy_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(IpInfoNotifier)
final ipInfoProvider = IpInfoNotifierProvider._();

final class IpInfoNotifierProvider
    extends $AsyncNotifierProvider<IpInfoNotifier, IpInfo> {
  IpInfoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ipInfoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ipInfoNotifierHash();

  @$internal
  @override
  IpInfoNotifier create() => IpInfoNotifier();
}

String _$ipInfoNotifierHash() => r'36efb68f13770d4734b11512f969cb97027db5ca';

abstract class _$IpInfoNotifier extends $AsyncNotifier<IpInfo> {
  FutureOr<IpInfo> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<IpInfo>, IpInfo>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<IpInfo>, IpInfo>,
              AsyncValue<IpInfo>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ActiveProxyNotifier)
final activeProxyProvider = ActiveProxyNotifierProvider._();

final class ActiveProxyNotifierProvider
    extends $StreamNotifierProvider<ActiveProxyNotifier, ProxyItemEntity> {
  ActiveProxyNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeProxyProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeProxyNotifierHash();

  @$internal
  @override
  ActiveProxyNotifier create() => ActiveProxyNotifier();
}

String _$activeProxyNotifierHash() =>
    r'9dec826d63098cee222d08bfd817824fd29f2a6f';

abstract class _$ActiveProxyNotifier extends $StreamNotifier<ProxyItemEntity> {
  Stream<ProxyItemEntity> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ProxyItemEntity>, ProxyItemEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProxyItemEntity>, ProxyItemEntity>,
              AsyncValue<ProxyItemEntity>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
