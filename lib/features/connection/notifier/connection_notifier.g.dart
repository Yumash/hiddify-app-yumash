// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ConnectionNotifier)
final connectionProvider = ConnectionNotifierProvider._();

final class ConnectionNotifierProvider
    extends $StreamNotifierProvider<ConnectionNotifier, ConnectionStatus> {
  ConnectionNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectionNotifierHash();

  @$internal
  @override
  ConnectionNotifier create() => ConnectionNotifier();
}

String _$connectionNotifierHash() =>
    r'a37b3fe49c612255ad949c1f24f05ece98ca905e';

abstract class _$ConnectionNotifier extends $StreamNotifier<ConnectionStatus> {
  Stream<ConnectionStatus> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ConnectionStatus>, ConnectionStatus>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ConnectionStatus>, ConnectionStatus>,
              AsyncValue<ConnectionStatus>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(serviceRunning)
final serviceRunningProvider = ServiceRunningProvider._();

final class ServiceRunningProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  ServiceRunningProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serviceRunningProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serviceRunningHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return serviceRunning(ref);
  }
}

String _$serviceRunningHash() => r'97c607374d0cd4b60a81f87ef251a3d3c8109c5b';
