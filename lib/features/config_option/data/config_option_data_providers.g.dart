// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_option_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(configOptionRepository)
final configOptionRepositoryProvider = ConfigOptionRepositoryProvider._();

final class ConfigOptionRepositoryProvider
    extends
        $FunctionalProvider<
          ConfigOptionRepository,
          ConfigOptionRepository,
          ConfigOptionRepository
        >
    with $Provider<ConfigOptionRepository> {
  ConfigOptionRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configOptionRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configOptionRepositoryHash();

  @$internal
  @override
  $ProviderElement<ConfigOptionRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ConfigOptionRepository create(Ref ref) {
    return configOptionRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConfigOptionRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConfigOptionRepository>(value),
    );
  }
}

String _$configOptionRepositoryHash() =>
    r'028e1e389653b1e731247e07dd8f51619dbd34c3';
