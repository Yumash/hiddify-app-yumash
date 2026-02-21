// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singbox_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(singboxService)
final singboxServiceProvider = SingboxServiceProvider._();

final class SingboxServiceProvider
    extends $FunctionalProvider<SingboxService, SingboxService, SingboxService>
    with $Provider<SingboxService> {
  SingboxServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'singboxServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$singboxServiceHash();

  @$internal
  @override
  $ProviderElement<SingboxService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SingboxService create(Ref ref) {
    return singboxService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SingboxService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SingboxService>(value),
    );
  }
}

String _$singboxServiceHash() => r'0ad18b5822a4377e48229ef8aa5f8e3cc01dc010';
