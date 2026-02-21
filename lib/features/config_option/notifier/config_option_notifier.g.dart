// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_option_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ConfigOptionNotifier)
final configOptionProvider = ConfigOptionNotifierProvider._();

final class ConfigOptionNotifierProvider
    extends $AsyncNotifierProvider<ConfigOptionNotifier, bool> {
  ConfigOptionNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configOptionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configOptionNotifierHash();

  @$internal
  @override
  ConfigOptionNotifier create() => ConfigOptionNotifier();
}

String _$configOptionNotifierHash() =>
    r'06b0e8e75cb81fef313b81bf23a974326156b078';

abstract class _$ConfigOptionNotifier extends $AsyncNotifier<bool> {
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
