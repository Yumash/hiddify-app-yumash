// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_settings_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(IgnoreBatteryOptimizations)
final ignoreBatteryOptimizationsProvider =
    IgnoreBatteryOptimizationsProvider._();

final class IgnoreBatteryOptimizationsProvider
    extends $AsyncNotifierProvider<IgnoreBatteryOptimizations, bool> {
  IgnoreBatteryOptimizationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ignoreBatteryOptimizationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ignoreBatteryOptimizationsHash();

  @$internal
  @override
  IgnoreBatteryOptimizations create() => IgnoreBatteryOptimizations();
}

String _$ignoreBatteryOptimizationsHash() =>
    r'79db5e7087633a23b132fda3833d135a05db0492';

abstract class _$IgnoreBatteryOptimizations extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ResetTunnel)
final resetTunnelProvider = ResetTunnelProvider._();

final class ResetTunnelProvider
    extends $AsyncNotifierProvider<ResetTunnel, void> {
  ResetTunnelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resetTunnelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resetTunnelHash();

  @$internal
  @override
  ResetTunnel create() => ResetTunnel();
}

String _$resetTunnelHash() => r'ec5e18904442cbf8fef92fd6350450a56ffc5453';

abstract class _$ResetTunnel extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
