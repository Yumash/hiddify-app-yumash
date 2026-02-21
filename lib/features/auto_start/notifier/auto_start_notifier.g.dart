// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_start_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AutoStartNotifier)
final autoStartProvider = AutoStartNotifierProvider._();

final class AutoStartNotifierProvider
    extends $AsyncNotifierProvider<AutoStartNotifier, bool> {
  AutoStartNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'autoStartProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$autoStartNotifierHash();

  @$internal
  @override
  AutoStartNotifier create() => AutoStartNotifier();
}

String _$autoStartNotifierHash() => r'92e36fd56fb5c2bb8347c3a598d0e72b0f3d6ca4';

abstract class _$AutoStartNotifier extends $AsyncNotifier<bool> {
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
