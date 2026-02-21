// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(profileRepository)
final profileRepositoryProvider = ProfileRepositoryProvider._();

final class ProfileRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProfileRepository>,
          ProfileRepository,
          FutureOr<ProfileRepository>
        >
    with
        $FutureModifier<ProfileRepository>,
        $FutureProvider<ProfileRepository> {
  ProfileRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<ProfileRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ProfileRepository> create(Ref ref) {
    return profileRepository(ref);
  }
}

String _$profileRepositoryHash() => r'd9e4164cae062436a8b567e1d3af7b31c1e25285';

@ProviderFor(profileDataSource)
final profileDataSourceProvider = ProfileDataSourceProvider._();

final class ProfileDataSourceProvider
    extends
        $FunctionalProvider<
          ProfileDataSource,
          ProfileDataSource,
          ProfileDataSource
        >
    with $Provider<ProfileDataSource> {
  ProfileDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileDataSourceHash();

  @$internal
  @override
  $ProviderElement<ProfileDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProfileDataSource create(Ref ref) {
    return profileDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileDataSource>(value),
    );
  }
}

String _$profileDataSourceHash() => r'378425a89730b89451eb948c19ff679ec1568caa';

@ProviderFor(profilePathResolver)
final profilePathResolverProvider = ProfilePathResolverProvider._();

final class ProfilePathResolverProvider
    extends
        $FunctionalProvider<
          ProfilePathResolver,
          ProfilePathResolver,
          ProfilePathResolver
        >
    with $Provider<ProfilePathResolver> {
  ProfilePathResolverProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profilePathResolverProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profilePathResolverHash();

  @$internal
  @override
  $ProviderElement<ProfilePathResolver> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProfilePathResolver create(Ref ref) {
    return profilePathResolver(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfilePathResolver value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfilePathResolver>(value),
    );
  }
}

String _$profilePathResolverHash() =>
    r'c41a0408a070cb329aca4e74eb5412c599c67a3c';
