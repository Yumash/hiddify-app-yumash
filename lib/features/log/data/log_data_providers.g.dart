// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(logRepository)
final logRepositoryProvider = LogRepositoryProvider._();

final class LogRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<LogRepository>,
          LogRepository,
          FutureOr<LogRepository>
        >
    with $FutureModifier<LogRepository>, $FutureProvider<LogRepository> {
  LogRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<LogRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LogRepository> create(Ref ref) {
    return logRepository(ref);
  }
}

String _$logRepositoryHash() => r'5d99f8d60650ce2325f3952d86359b676998521f';

@ProviderFor(logPathResolver)
final logPathResolverProvider = LogPathResolverProvider._();

final class LogPathResolverProvider
    extends
        $FunctionalProvider<LogPathResolver, LogPathResolver, LogPathResolver>
    with $Provider<LogPathResolver> {
  LogPathResolverProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logPathResolverProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logPathResolverHash();

  @$internal
  @override
  $ProviderElement<LogPathResolver> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LogPathResolver create(Ref ref) {
    return logPathResolver(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LogPathResolver value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LogPathResolver>(value),
    );
  }
}

String _$logPathResolverHash() => r'6b0cfa2357de4dc93ac98e34a0a4919c9fcd50b8';
