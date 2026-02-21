// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'window_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WindowNotifier)
final windowProvider = WindowNotifierProvider._();

final class WindowNotifierProvider
    extends $AsyncNotifierProvider<WindowNotifier, void> {
  WindowNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'windowProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$windowNotifierHash();

  @$internal
  @override
  WindowNotifier create() => WindowNotifier();
}

String _$windowNotifierHash() => r'a74a0cb8bed091ed2d7b7db2334de0f6bea54896';

abstract class _$WindowNotifier extends $AsyncNotifier<void> {
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
