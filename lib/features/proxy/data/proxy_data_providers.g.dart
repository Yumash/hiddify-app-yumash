// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proxy_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(proxyRepository)
final proxyRepositoryProvider = ProxyRepositoryProvider._();

final class ProxyRepositoryProvider
    extends
        $FunctionalProvider<ProxyRepository, ProxyRepository, ProxyRepository>
    with $Provider<ProxyRepository> {
  ProxyRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'proxyRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$proxyRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProxyRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProxyRepository create(Ref ref) {
    return proxyRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProxyRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProxyRepository>(value),
    );
  }
}

String _$proxyRepositoryHash() => r'2536048cbbce0783c9625142267b5b938b6ed41a';
