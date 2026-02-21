// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_preferences.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DebugModeNotifier)
final debugModeProvider = DebugModeNotifierProvider._();

final class DebugModeNotifierProvider
    extends $NotifierProvider<DebugModeNotifier, bool> {
  DebugModeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'debugModeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$debugModeNotifierHash();

  @$internal
  @override
  DebugModeNotifier create() => DebugModeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$debugModeNotifierHash() => r'392576255e54682b71e3bf51ea78398267f09207';

abstract class _$DebugModeNotifier extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
